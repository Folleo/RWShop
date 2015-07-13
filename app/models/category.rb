class Category < ActiveRecord::Base
  has_many :products

  validates_presence_of :name

  validates :discount_amount, numericality: {
                                allow_blank: true,
                                greater_than_or_equal_to: 0,
                                only_integer: true}

  validates :discount_percent, numericality: {
                                 allow_blank: true,
                                 greater_than_or_equal_to: 0,
                                 less_than_or_equal_to: 100}

  def has_discount
    if !discount_amount.nil? && !discount_percent.nil?
      true
    else
      false
    end
  end

end
