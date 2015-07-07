class AdminController < ApplicationController
  before_action :authenticate_user!, :require_admin

  def index
    @products = Product.all.order(:id)
  end

  def require_admin
    if signed_in? and current_user.role?(Role::ADMIN)
      true
    else
      redirect_to root_path
    end
  end

end
