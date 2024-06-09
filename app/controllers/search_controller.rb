# app/controllers/search_controller.rb
# class SearchController < ApplicationController
#     def index
#       @products = Product.search_by_name(params[:query])
#       @categories = Category.search_by_name(params[:query])
  
#       respond_to do |format|
#         format.html # fallback for standard requests
#         format.json {
#           render json: {
#             products: @products.map { |product| { name: product.name, url: product_path(product) } },
#             categories: @categories.map { |category| { name: category.name, url: category_path(category) } }
#           }
#         }
#       end
#     end
#   end

class SearchController < ApplicationController
    def index
      if params[:query].present?
        @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
        @categories = Category.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @products = []
        @categories = []
      end
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: { products: @products, categories: @categories } }
      end
    end
  end
  