# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, except: [:index]
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :check_purchase, only: [:create, :edit, :update]

  def create
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @product.reviews.exists?(user: current_user)
      flash[:alert] = "Vous avez déjà laissé un avis pour ce produit."
      redirect_to @product
    elsif @review.save
      flash[:notice] = "Votre avis a été ajouté avec succès."
      redirect_to @product
    else
      flash[:alert] = "Il y a eu un problème avec votre avis."
      render 'products/show'
    end
  end

  def index
    @reviews = current_user.reviews.includes(:product)
  end

  def edit
    @review = @product.reviews.find(params[:id])
  end

  def update
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Votre avis a été mis à jour avec succès."
      redirect_to @product
    else
      flash[:alert] = "Il y a eu un problème avec la mise à jour de votre avis."
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @product, notice: 'Votre avis a été supprimé avec succès.'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = @product.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def check_purchase
    unless current_user.orders.joins(:order_items).where(order_items: { product_id: @product.id }).exists?
      redirect_to @product, alert: "Vous devez acheter ce produit pour laisser un avis."
    end
  end
end
