class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  
  def like
    @product = Product.find(params[:id])
    @product.increment!(:likes)
    respond_to do |format|
      format.html { redirect_to @product }
      format.js   # Create like.js.erb for handling JS response
    end
  end

 private

  def product_params
    params.require(:product).permit(:name, :content)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
