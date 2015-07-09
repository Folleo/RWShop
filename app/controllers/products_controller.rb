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
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  # GET /product_row/1
  def show_row
    @product = Product.find(params[:id])
    respond_to do |format|
      format.js
      format.html
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
    @product = Product.find(params[:id])
    respond_to do | format |
      format.js
      format.html
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @products = Product.all.order(:id)
    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
      else
        flash[:notice] = 'There are some errors while creating new product.'
      end
      format.js
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        #format.json { render :show, status: :ok, location: @product }
        format.js
      else
        format.html { render :edit }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if !@product.product_sale.nil?
      @product.product_sale.destroy
    end
    @product.destroy
    @products = Product.all.order(:id)
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :category_id, :price, :image)
    end
end
