class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] # Assurez-vous que l'utilisateur est authentifié pour les actions de création, modification et suppression

  def index
    @page = params.fetch(:page, 0).to_i
    @per_page = 16
    @total_pages = (Product.count / @per_page.to_f).ceil

    @products = Product.offset(@page * @per_page).limit(@per_page)
    @categories = Category.all
  end

  def show
    @similar_products = Product.random_products_from_same_category(@product) 
    @review = @product.reviews.build
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Le produit a été créé avec succès."
    else
      render 'new'
    end
  end
  

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
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
   params.require(:product).permit(:name, :description, :image, :price, :category_id)
 end
 

  def set_product
    @product = Product.find(params[:id])
  end
end
