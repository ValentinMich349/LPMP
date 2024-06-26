require 'faker'
User.destroy_all
Product.destroy_all
Category.destroy_all
Event.destroy_all
City.destroy_all

User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
  first_name: "Admin",
  last_name: "User",
  pseudo: "admin"
)

users = 10.times.map do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    pseudo: Faker::Internet.username
  )
end

categories = [
  {id: 1, name: 'Modèles 3D', icon: 'cube' },
  {id: 2, name: 'Modèles Chibi', icon: 'child' },
  {id: 3, name: 'Accessoires', icon: 'glasses' }
]

categories.each do |category|
  Category.create!(category)
end

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

categories = Category.all

20.times do
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

Product.create!(
      name: "Gojo satoru",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Modèles chibi du personnage Gojo Satoru du manga Jujutsu Kaisen",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1717659187/chibi_gojo_xlpt2q.jpg",
      category: Category.find(2),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Sebastian",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Modèles chibi du personnage Sebastian du manga Black buttler",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1717659186/chibi_sebastian_nta2lk.jpg",
      category: Category.find(2),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "San goku",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine du personnage San goku du manga DragonBall",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1717659188/figurine_san1_huafnj.jpg",
      category: Category.find(1),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Poster Chibi",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Poster de plusieurs chibi",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1717660683/_77af1d8c-dba7-4c26-b3f6-e43243fbf658_f7ptrp.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Hashirama Senju",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Hashirama Senju Manga Naruto",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719475137/f618776c11f57145b448f7bc463c4af3_g8sgnu.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Naruto",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Naruto Fusion Kurama Manga naruto",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719475133/OIP_1_yfnazm.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Madara Uchiha",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Madara Uchiha x kurama Manga naruto",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719475126/0d7bc4c97aff468c514c2a79a61999a9_tdrhag.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Luffy",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Luffy Manga One piece",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393384/R_mhluay.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Femto",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Femto Manga Berserk",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393384/R_2_sw3hw6.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Ace",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Ace Manga One piece",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393383/R_1_korzjr.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Pilier de la flamme Rengoku Kyojuro Manga Demon slayer",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Rengoku Kyojuro",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393383/product-image-1462562047-768x1024_a34dkl.jpgxvS",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Shigaraki Tomura",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Shigaraki Tomura Shigaraki Tomura My hero academia",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393380/my-hero-academia-figurine-tomura-hvsv_oyrbli.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Deku",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Deku one for all Shigaraki Tomura My hero academia",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393380/kotobukiya-227149-my-hero-academia-izuku-midoriya-dark-deku-artfxj-2_aapdkb.png",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Luffy Ultime",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine luffy GodMode mange One piece",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393379/figurine-one-piece-luffy-liste_yktwae.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Griffith",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Griffith Manga Berserk",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393379/Figurine-Figma-Griffith-Berserk-1_b5gpuw.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Mechant Berserk",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Enssemble de figurine Berserk",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393376/FIGURE-021614_07_gos9qk.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Satoru Gojo",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Satoru Gojo manga Jujustsu kysen",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393375/430fdf6bce8a4d8eb370178e6c0eb7e0_qnlgms.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Itadori Yuji",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Itadori Yuji Fusion Demonic manga Jujustsu kysen",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393375/FIGBTN621047_1_s1gokp.webp",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Pig Head",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Pig Head Dance des lames manga demon slayer",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393375/demon-slayer-figurine-inosuke-figuarts-zero_eawf3n.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Figth Berserk",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Figth manga berserk",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393374/127081_vwxxto.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Figth My hero academia",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Figth manga My hero academia",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393374/d0367ae6d4e3c967e4662b9cc51a495d_q7kfza.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Kanroji Mitsuri",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Kanroji Mitsuri manga Jujustsu kysen",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393374/91CDhhB_gEL._AC_SL1500__ohghl8.jpg",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )
    Product.create!(
      name: "Gutz",
      price: Faker::Commerce.price(range: 10..100.0),
      description: "Figurine Gutz manga berserk",
      image: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719393374/4582535948577_ukbgr0.webp",
      category: Category.find(3),
      likes: rand(0..100),
      rating: (rand(0..10) / 2.0).round(1)
    )

# Create events
events = [
  {
    name: "Chasse au One Piece",
    description: "Rejoignez Luffy et son équipage à la recherche du one piece dans toute la ville !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394986/event_jplc5i.webp"
  },
  {
    name: "Can you win ?",
    description: "Venez participer à la reproduction des batailles épiques de vos mangas préférés ! Incarnez ainsi votre personnage préféré !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394268/event2_fghgrr.jpg"
  },
  {
    name: "Anime Session",
    description: "Réservez vos places pour assister à l'avant première de cette série à succès, enfin adapté en anime !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394268/event3_jkmk7x.jpg"
  },
  {
    name: "Salon du soleil levant",
    description: "Venez découvrir les nouveautés de l'univers manga ! Repas et boissons inspiré également des plats d'animés !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394269/event4_xuf0bs.jpg"
  },
  {
    name: "Can you create up ?",
    description: "Concert du groupe d'idol 'Can you create up ? ' Les places sont d'hors et déjà en vente sur notre site !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394273/event5_p5bdi3.jpg"
  },
  {
    name: "Read it",
    description: "Venez participer à ce grand salon de thé et partagez vos oeuvres préférés !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394274/event6_gsdfxx.jpg"
  },
  {
    name: "Can Create Event ?",
    description: "Vous vous sentez l'âme d'un organisateur chevronné ? Venez tester vos capacités à pouvoir animer !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394275/event7_ewiz4j.jpg"
  },
  {
    name: "Shojo Show",
    description: "Découvrez les nouveaux Shojo tendances du moment ! Participez aux activités sur place et découvrez votre nouvelle âme soeur ?",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394277/event8_rax0w3.jpg"
  },
  {
    name: "Attack Convention",
    description: "Rien de mieux qu'une partie géante de paintball dans la tenue de votre personnage préféré !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394278/event9_ltd38l.jpg"
  },
  {
    name: "Paint The World",
    description: "Venez Assister à la convention afin d'y découvrir vos illustrateurs préférés et y apprendre leurs techniques !",
    image_url: "https://res.cloudinary.com/dhklqroj3/image/upload/v1719394281/event10_mqiihp.jpg"
  }
]

events.each do |event|
  Event.create!(
    name: event[:name],
    description: event[:description],
    price: Faker::Commerce.price(range: 10..100.0),
    start: Faker::Time.forward(days: 30, period: :day),
    end: Faker::Time.forward(days: 30, period: :night),
    city: City.all.sample,
    image_url: event[:image_url],
    user: users.sample
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

Store.create!(
  name: "Boutique Lyon",
  address: "85 Rue de la République",
  city: "Lyon",
  state: "Auvergne-Rhône-Alpes",
  zip_code: "69002",
  phone_number: "+33 4 72 10 30 40",
  email: "contact@boutiquelyon.fr",
  latitude: 45.7640,
  longitude: 4.8357
)

Store.create!(
  name: "Magasin de Marseille",
  address: "10 Rue Saint-Ferréol",
  city: "Marseille",
  state: "Provence-Alpes-Côte d'Azur",
  zip_code: "13001",
  phone_number: "+33 4 91 00 50 60",
  email: "contact@magasindemarseille.fr",
  latitude: 43.2965,
  longitude: 5.3698
)

Store.create!(
  name: "Boutique Toulouse",
  address: "23 Rue d'Alsace Lorraine",
  city: "Toulouse",
  state: "Occitanie",
  zip_code: "31000",
  phone_number: "+33 5 61 00 20 30",
  email: "contact@boutiquetoulouse.fr",
  latitude: 43.6047,
  longitude: 1.4442
)

Store.create!(
  name: "Magasin de Nantes",
  address: "15 Rue Crébillon",
  city: "Nantes",
  state: "Pays de la Loire",
  zip_code: "44000",
  phone_number: "+33 2 40 00 10 20",
  email: "contact@magasindenantes.fr",
  latitude: 47.2184,
  longitude: -1.5536
)

Store.create!(
  name: "Librairie de Bordeaux",
  address: "50 Rue Sainte-Catherine",
  city: "Bordeaux",
  state: "Nouvelle-Aquitaine",
  zip_code: "33000",
  phone_number: "+33 5 56 00 30 40",
  email: "contact@librairiedebordeaux.fr",
  latitude: 44.8378,
  longitude: -0.5792
)

Store.create!(
  name: "Boutique Lille",
  address: "32 Rue de Béthune",
  city: "Lille",
  state: "Hauts-de-France",
  zip_code: "59000",
  phone_number: "+33 3 20 00 40 50",
  email: "contact@boutiquelille.fr",
  latitude: 50.6292,
  longitude: 3.0573
)

Store.create!(
  name: "Magasin de Nice",
  address: "28 Avenue Jean Médecin",
  city: "Nice",
  state: "Provence-Alpes-Côte d'Azur",
  zip_code: "06000",
  phone_number: "+33 4 93 00 20 30",
  email: "contact@magasindenice.fr",
  latitude: 43.7102,
  longitude: 7.2620
)

Store.create!(
  name: "Librairie de Strasbourg",
  address: "18 Rue des Grandes Arcades",
  city: "Strasbourg",
  state: "Grand Est",
  zip_code: "67000",
  phone_number: "+33 3 88 00 50 60",
  email: "contact@librairiedestrasbourg.fr",
  latitude: 48.5839,
  longitude: 7.7455
)

puts "Seed data created successfully!"


