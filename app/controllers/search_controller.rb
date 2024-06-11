class SearchController < ApplicationController
    def index
      if params[:query].present?
        @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
        @categories = Category.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @products = []
        @categories = []
      end
  
      @popular_products = Product.order(likes: :desc).limit(4)
      @new_products = Product.order(created_at: :desc).limit(4)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: { products: @products, categories: @categories } }
      end

    end
  end
  