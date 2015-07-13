class CategoriesController < ApplicationController
  before_action :set_category, only: [:bind_products, :edit, :update, :destroy]

  def index
    redirect_to root_path
  end

  # GET /categories/new
  def new
    @category = Category.new
    respond_to do |format|
      format.js
    end
  end

  # GET /categories/1/edit
  def edit
    respond_to do | format |
      format.js
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @categories = Category.all.order(:id)
    if @category.save
      flash[:notice] = 'Category was successfully created.'
    else
      flash[:error] = @category.errors.full_messages.first
    end
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully updated.'
    else
      flash[:error] = @category.errors.full_messages.first
      set_category
    end
    respond_to do |format|
      format.js
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    products = Product.where(category_id: params[:id])
    unless products.nil?
      products.destroy_all
    end
    if @category.destroy
      flash[:notice] = 'Category has been successfully deleted'
    else
      flash[:error] = @category.errors.full_messages.first
    end
    @categories = Category.all.order('id')
    respond_to do |format|
      format.js
    end
  end

  def show_row
    @category = Category.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def bind_products
    if is_number?(params[:new_category_id])
      @new_category = Category.find(params[:new_category_id])
      products = Product.where(category_id: @category.id)
      if products.update_all(category_id: @new_category.id)
        flash[:notice] = 'Products successfully binded to new category'
      end
    else
      flash[:error] = 'Incorrect value of new category id'
    end
    render nothing: true
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :discount_percent, :discount_amount, :image)
    end
end
