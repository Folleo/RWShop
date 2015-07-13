class AdminController < ApplicationController
  before_action :authenticate_user!, :require_admin

  def index
  end

  def products
    @products = Product.all.order(:id)
  end

  def categories
    @categories = Category.all.order(:id)
  end

  def users
    @users = User.all.order(:id)
  end

  def change_user_state
    @user = User.find(params[:id])
    if @user.update_attribute(:disabled, !@user.disabled)
      flash[:notice] = 'User state has been successfully changed.'
    end
    respond_to do |format|
      format.js
    end
  end

  def require_admin
    if signed_in? and current_user.role?(Role::ADMIN)
      true
    else
      render_403
    end
  end

end
