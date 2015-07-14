class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.joins(:product_sale).order('product_sales.sales DESC').limit(Product::POPULAR_PRODUCTS_NUMBER)
    @order_item = current_order.order_items.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @order_item = current_order.order_items.find_by(product_id: @product.id)
    if @order_item.nil?
      @order_item = current_order.order_items.new
      @order_item.quantity = 1
    end
  end

  # GET /product_row/1
  def show_row
    @product = Product.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /products/from_category
  def from_category
    if params[:cat_id].nil?
      @products = Product.joins(:product_sale).order('product_sales.sales DESC').limit(Product::POPULAR_PRODUCTS_NUMBER)
    else
      @products = Product.where(:category_id => params[:cat_id])
    end
    respond_to do |format|
      format.js
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    respond_to do |format|
      format.js
    end
  end

  # GET /products/1/edit
  def edit
    respond_to do | format |
      format.js
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @products = Product.all.order(:id)
    if @product.save
      flash[:notice] = 'Product has been successfully created.'
    else
      flash[:error] = @product.errors.full_messages.first
    end
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      flash[:notice] = 'Product has been successfully updated.'
    else
      flash[:error] = @product.errors.full_messages.first
      set_product
    end
    respond_to do |format|
      format.js
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    unless @product.product_sale.nil?
      @product.product_sale.destroy
    end
    @product.destroy
    flash[:notice] = 'Product has been successfully deleted.'
    @products = Product.all.order(:id)
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :category_id, :price, :image, :active)
    end
end
