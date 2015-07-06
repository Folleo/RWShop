class CartsController < ApplicationController
  def show
    if current_order.order_status_id == 1
      @order_items = current_order.order_items.sort_by(&:created_at)
    end
  end
end
