class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def example
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.joins(:product_sale).order('product_sales.sales DESC').limit(Product::POPULAR_PRODUCTS_NUMBER)
    @categories = Category.all.order('id')
    @order_item = current_order.order_items.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
    # @cart_action = @product.cart_action current_user.try :id
    @order_item = current_order.order_items.new
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
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category_id, :price)
    end
end
