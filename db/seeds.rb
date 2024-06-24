require 'faker'

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
  { name: 'Accessoires', icon: 'glasses' }
]

categories.each do |category|
  Category.create!(category)
end

# Create cities
City.destroy_all

french_cities = [
  { name: 'Paris', latitude: 48.8566, longitude: 2.3522 },
  { name: 'Marseille', latitude: 43.2965, longitude: 5.3698 },
  { name: 'Lyon', latitude: 45.7640, longitude: 4.8357 },
  { name: 'Toulouse', latitude: 43.6045, longitude: 1.4442 },
  { name: 'Nice', latitude: 43.7102, longitude: 7.2620 },
  { name: 'Nantes', latitude: 47.2184, longitude: -1.5536 },
  { name: 'Strasbourg', latitude: 48.5734, longitude: 7.7521 },
  { name: 'Montpellier', latitude: 43.6108, longitude: 3.8767 },
  { name: 'Bordeaux', latitude: 44.8378, longitude: -0.5792 },
  { name: 'Lille', latitude: 50.6292, longitude: 3.0573 },
  { name: 'Rennes', latitude: 48.1173, longitude: -1.6778 },
  { name: 'Reims', latitude: 49.2583, longitude: 4.0317 },
  { name: 'Le Havre', latitude: 49.4944, longitude: 0.1079 },
  { name: 'Saint-Étienne', latitude: 45.4397, longitude: 4.3872 },
  { name: 'Toulon', latitude: 43.1242, longitude: 5.9280 },
  { name: 'Angers', latitude: 47.4784, longitude: -0.5632 },
  { name: 'Grenoble', latitude: 45.1885, longitude: 5.7245 },
  { name: 'Dijon', latitude: 47.3220, longitude: 5.0415 },
  { name: 'Nîmes', latitude: 43.8367, longitude: 4.3601 },
  { name: 'Aix-en-Provence', latitude: 43.5297, longitude: 5.4474 }
]

french_cities.each do |city|
  City.create!(name: city[:name], latitude: city[:latitude], longitude: city[:longitude])
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


