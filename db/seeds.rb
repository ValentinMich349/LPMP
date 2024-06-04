# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Supprimer toutes les données existantes de la base de données
Article.destroy_all

# Créer de nouveaux articles
Article.create(title: "Premier article", body: "Ceci est le contenu du premier article.")
Article.create(title: "Deuxième article", body: "Ceci est le contenu du deuxième article.")
Article.create(title: "Troisième article", body: "Ceci est le contenu du troisième article.")

puts "Seed terminé !"