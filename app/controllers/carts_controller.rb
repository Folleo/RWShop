class CartsController < ApplicationController
  def show
    if current_order.order_status_id == 1
      @order_items = current_order.order_items
    end
  end
end
