class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      # Find from session
      Order.find(session[:order_id])
    else
      if user_signed_in?
        # Try to load from the database unfinished order
        order = Order.where(:user_id => current_user.id, :order_status_id => 1).order(:updated_at).last
        if !order.nil?
          order
        else
          Order.new
        end
      else
        # Unregistered user vithow session
        Order.new
      end
    end
  end

end
