class ProductsController < ApplicationController
  def index
    @products = Product.all
    fresh_when last_modified: @products.maximum(:updated_at)
  end

  def show
    @product = Product.find(params[:id])
    expires_in 1.minutes
    fresh_when etag: @product, last_modified: @product.updated_at, public: true
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Successfully created product."
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product, notice: "Successfully created product."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Successfully destroyed product."
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
