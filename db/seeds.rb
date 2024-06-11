require 'faker'

# Clear existing data
User.destroy_all
Category.destroy_all
Product.destroy_all

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

# Create products
categories = Category.all

50.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10..100.0),
    description: Faker::Lorem.paragraph,
    image: Faker::LoremFlickr.image(size: "300x300", search_terms: ['product']),
    category: categories.sample
  )
end

puts "Seed data created successfully!"
