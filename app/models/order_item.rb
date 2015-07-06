class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def has_discount
    if !product.category.discount_amount.nil? &&
       !product.category.discount_percent.nil? &&
        quantity >= product.category.discount_amount
      true
    else
      false
    end
  end

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    if has_discount
      unit_price * quantity * (1 - product.category.discount_percent / 100.0)
    else
      unit_price * quantity
    end
  end

  def update_sales
    ProductSale.find_by_product_id(product.id).increment!(:sales, by = quantity)
  end

  private

  def product_present
    if product.nil?
      errors.add(:product, 'is not valid or is not active.')
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, 'is not a valid order.')
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
