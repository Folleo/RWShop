class Product < ActiveRecord::Base

  has_many :order_items
  has_one :product_sale

  default_scope { where(active: true) }

  POPULAR_PRODUCTS_NUMBER = 9

end
