# Seed products with associated Cloudinary URLs
products = [
  { name: 'Figurine San Goku', price: 19.99, description: 'Super figurine Sangoku', cloudinary_url: 'https://res.cloudinary.com/dhklqroj3/image/upload/v1717659189/figurine_san3_dgxo4h.jpg' },
  { name: 'Chibi Sebastian', price: 29.99, description: 'Mignonne figurine de Sebastian', cloudinary_url: 'https://res.cloudinary.com/dhklqroj3/image/upload/v1717659186/chibi_sebastian_nta2lk.jpg' },
  { name: 'Chibi Satoru Gojo', price: 39.99, description: 'Vous ne verrez pas ses beaux yeux maintenant', cloudinary_url: 'https://res.cloudinary.com/dhklqroj3/image/upload/v1717659187/chibi_gojo_xlpt2q.jpg' },
  # Add more products as needed
]

# Seed products with associated Cloudinary URLs
products.each do |product_data|
  product = Product.create!(
    name: product_data[:name],
    price: product_data[:price],
    description: product_data[:description],
    cloudinary_url: product_data[:cloudinary_url]
  )
  puts "Product #{product.name} created with Cloudinary URL #{product_data[:cloudinary_url]}"
end
