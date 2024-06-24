class ImagesController < ApplicationController
    def index
      if params[:search].present?
        @images = search_images(params[:search])
      else
        @images = list_all_images
      end
    end
  
    private
  
    def list_all_images
      images = []
      next_cursor = nil
  
      loop do
        response = Cloudinary::Api.resources(type: 'upload', resource_type: 'image', max_results: 500, next_cursor: next_cursor)
        images.concat(response['resources'])
        next_cursor = response['next_cursor']
        break if next_cursor.nil?
      end
  
      images
    rescue Cloudinary::Api::Error => e
      flash[:alert] = "Erreur lors de la récupération des images : #{e.message}"
      []
    end
  
    def search_images(prefix)
      images = []
      next_cursor = nil
  
      loop do
        response = Cloudinary::Api.resources(type: 'upload', resource_type: 'image', prefix: prefix, max_results: 500, next_cursor: next_cursor)
        images.concat(response['resources'])
        next_cursor = response['next_cursor']
        break if next_cursor.nil?
      end
  
      images
    rescue Cloudinary::Api::Error => e
      flash[:alert] = "Erreur lors de la récupération des images : #{e.message}"
      []
    end
  end
  