# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(
  name: 'Produit Exemple',
  price: 19.99,
  description: 'Ceci est un produit d\'exemple avec du contenu détaillé pour démontrer l\'affichage dans l\'application.'
)

Product.create(
  name: 'Deuxième Produit',
  price: 29.99,
  description: 'Ceci est un autre produit d\'exemple.'
)