require 'faker'
require 'geocoder'

# Clear existing data
User.destroy_all
Product.destroy_all
Category.destroy_all
Event.destroy_all
City.destroy_all

# Create users
User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
  first_name: "Admin",
  last_name: "User",
  pseudo: "admin"
)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    pseudo: Faker::Internet.username
  )
end

# Create categories
categories = [
  { name: 'Modèles 3D', icon: 'cube' },
  { name: 'Modèles Chibi', icon: 'child' },
  { name: 'Accessoires', icon: 'glasses' },
  { name: 'Événementiel', icon: 'calendar' }
]

categories.each do |category|
  Category.create!(category)
end

# Create cities
cities = ['Paris', 'Lyon', 'Marseille', 'Bordeaux', 'Lille']
cities.each do |city_name|
  results = Geocoder.search(city_name)
  if results.any?
    coordinates = results.first.coordinates
    City.create!(name: city_name, latitude: coordinates[0], longitude: coordinates[1])
  else
    puts "Coordinates not found for #{city_name}"
  end
end


# Create products
categories = Category.all

50.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10..100.0),
    description: Faker::Lorem.paragraph,
    image: Faker::LoremFlickr.image(size: "300x300", search_terms: ['product']),
    category: categories.sample,
    likes: rand(0..100),
    rating: (rand(0..10) / 2.0).round(1) 
  )
end

# Create events
20.times do
  Event.create!(
    name: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 10..100.0),
    start: Faker::Time.forward(days: 30, period: :day),
    end: Faker::Time.forward(days: 30, period: :night),
    localisation: cities.sample,
    city: City.all.sample,
    image_url: Faker::LoremFlickr.image(size: "600x400", search_terms: ['event'])
  )
end

Store.create!(
  name: "Boutique Paris",
  address: "123 Rue de Rivoli",
  city: "Paris",
  state: "Île-de-France",
  zip_code: "75001",
  phone_number: "+33 1 44 55 66 77",
  email: "contact@boutiqueparis.fr",
  latitude: 48.8608,
  longitude: 2.3377
)

Store.create!(
  name: "Magasin de sport",
  address: "123 Rue des Alpes",
  city: "Grenoble",
  state: "Auvergne-Rhône-Alpes",
  zip_code: "38000",
  phone_number: "04 76 87 90 10",
  email: "contact@magasindesport.fr",
  latitude: 45.1886,
  longitude: 5.7324
)

Store.create!(
  name: "Librairie du Sud",
  address: "45 Avenue de la Méditerranée",
  city: "Montpellier",
  state: "Occitanie",
  zip_code: "34000",
  phone_number: "04 67 52 00 20",
  email: "contact@librairiedusud.fr",
  latitude: 43.6108,
  longitude: 3.8767
)
puts "Seed data created successfully!"
