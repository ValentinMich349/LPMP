class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :wishlist_items
  has_many :wishlists, through: :wishlist_items

  belongs_to :category

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }

  validates :likes, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  # Ajout d'une méthode pour récupérer l'URL de l'image à partir de Cloudinary
  def cloudinary_image_url
    # Assurez-vous d'avoir une colonne image dans votre table products pour stocker l'ID de l'image sur Cloudinary
    if image.present?
      "https://res.cloudinary.com/#{ENV['CLOUDINARY_CLOUD_NAME']}/image/upload/#{image}"
    else
      # Si aucune image n'est disponible, vous pouvez renvoyer une URL d'image par défaut ou un message d'erreur
      "https://via.placeholder.com/300" # Exemple d'URL d'image par défaut (utilisez la vôtre)
    end
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart_items", "carts", "category", "wishlist_items", "wishlists"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "id_value", "image", "likes", "name", "price", "rating", "updated_at"]
  end
  
end
