class Product < ActiveRecord::Base

  validates_presence_of :name, :price, :category
  validates :price, numericality: { greater_than_or_equal_to: 0}

  belongs_to :category
  has_many :order_items
  has_one :product_sale

  default_scope { where(active: true) }

  POPULAR_PRODUCTS_NUMBER = 9

  def self.categories
    Category.all.order('id')
  end

end
