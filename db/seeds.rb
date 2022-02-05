# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Creating 4 users..."
User.create!(email: 'hannah@test.com', password: 'hannah', code: "hannah")
User.create!(email: 'victor@test.com', password: 'victor', code: "victor")
User.create!(email: 'matthew@test.com', password: 'matthew', code: "matthew")
User.create!(email: 'davide@test.com', password: 'davide', code: "davide")

puts "Creating 10 categories..."

Category.create!(category: "fast-food")
Category.create!(category: "deli")
Category.create!(category: "wine shop")
Category.create!(category: "fishmonger")
Category.create!(category: "cheesemonger")
Category.create!(category: "bakery")
Category.create!(category: "greengrocer")
Category.create!(category: "coffee shop")
Category.create!(category: "tea-room")
Category.create!(category: "butcher")

puts "Creating 20 businesses..."

business = Business.create!(
  name: "Surpriz ",
  description: "Restaurant animé servant des döner kebabs façon berlinoise au poulet, dans un espace simple et accueillant.",
  address: "110 Rue Oberkampf, 75011 Paris",
  category_id: 1,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/surpriz.jpeg"), filename: "surpriz.jpeg", content_type: "image/jpeg")

business = Business.create!(
  name: "GangNam Falafel",
  description: "Les saveurs du Gangnam Falafel Bowl parlent plusieurs langues et surtout la vôtre : falafels, feuilles de vigne, salade, riz nature avec quinoa ...",
  address: "92 Rue Saint-Maur, 75011 Paris",
  category_id: 1,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/gangnam_falafel.jpeg"), filename: "gangnam_falafel.jpeg", content_type: "image/jpeg")

business = Business.create!(
  name: "James Bún Oberkampf",
  description: "James Bun vous accueille dans un décor coloré et animé. Au menu, Bo Bun, sandwich Banh Mi et traditionnelle soupe Pho…",
  address: "126 Rue Oberkampf, 75011 Paris",
  category_id: 1,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/jamesbun.jpeg"), filename: "jamesbun.jpeg", content_type: "image/jpeg")

business = Business.create!(
  name: "The Beans on Fire",
  description: "Café lumineux décoré de bois clair servant des expressos et des plats légers, avec vente de café en grains torréfié sur place.
",
  address: "7 Rue du Général Blaise, 75011 Paris",
  category_id: 8,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/beansonfire.jpeg"), filename: "beansonfire.jpeg", content_type: "image/jpeg")

business = Business.create!(
  name: "Raftel Coffee Shop
",
  description: "Tartines délicieuses et cafés venus d'ailleurs. Voyagez en dehors de Paris le temps d'une pause café'.
",
  address: "16 Vla Gaudelet, 75011 Paris",
  category_id: 8,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/raftel.jpeg"), filename: "raftel.jpeg", content_type: "image/jpeg")

business = Business.create!(
  name: "Broken Biscuits Coffee Shop",
  description: "Deux petits comptoirs et quelques tabourets, histoire de déguster sur place les créations du jour en admirant Christine confectionner sandwiches et carrot cakes.deux petits comptoirs et quelques tabourets, histoire de déguster sur place les créations du jour en admirant Christine confectionner sandwiches et carrot cakes.'.
",
  address: "10 Pass. Rochebrune, 75011 Paris",
  category_id: 8,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/broken_biscuit.jpeg"), filename: "broken_biscuit.jpeg", content_type: "image/jpeg")

business = Business.create!(
  name: "Boucherie Dagault",
  description: "La Boucherie Dagault, c'est un rayon traiteur : crudités, fromages... · Des plats cuisinés artisanaux : purée, lasagnes, gratin dauphinois, épinards à la ...
'.
",
  address: "94 Rue Oberkampf, 75011 Paris",
  category_id: 10,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/boucherie.png"), filename: "boucherie.png", content_type: "image/png")


business = Business.create!(
  name: "Boucherie Imazighen",
  description: "La Boucherie Imazighen, vous propose d'incroyables viandes. Boeuf de kobé, Waygu, Charolaise...
'.
",
  address: "7 Rue de Ménilmontant, 75020 Paris",
  category_id: 10,
  user_id: 4
)

business.photo.attach(io: File.open("app/assets/images/beef.jpeg"), filename: "boucherie.jpeg", content_type: "image/jpeg")

puts "Creating 20 reward mechanism..."

RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 1)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 2)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 3)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 4)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 5)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 6)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 7)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 8)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 9)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 10)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 11)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 12)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 13)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 14)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 15)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 16)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 17)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 18)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 19)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 20)

puts "Creating 20 cards..."

Card.create!(points: rand(11), business_id: 1, user_id: 1)
# Card.create!(points: rand(11), business_id: 2, user_id: 2)
# Card.create!(points: rand(11), business_id: 3, user_id: 3)
# Card.create!(points: rand(11), business_id: 4, user_id: 4)
# Card.create!(points: rand(11), business_id: 5, user_id: 1)
# Card.create!(points: rand(11), business_id: 6, user_id: 2)
# Card.create!(points: rand(11), business_id: 7, user_id: 3)
# Card.create!(points: rand(11), business_id: 8, user_id: 4)
# Card.create!(points: rand(11), business_id: 9, user_id: 1)
# Card.create!(points: rand(11), business_id: 10, user_id: 2)
# Card.create!(points: rand(11), business_id: 11, user_id: 3)
# Card.create!(points: rand(11), business_id: 12, user_id: 4)
# Card.create!(points: rand(11), business_id: 13, user_id: 1)
# Card.create!(points: rand(11), business_id: 14, user_id: 2)
# Card.create!(points: rand(11), business_id: 15, user_id: 3)
# Card.create!(points: rand(11), business_id: 16, user_id: 4)
# Card.create!(points: rand(11), business_id: 17, user_id: 1)
# Card.create!(points: rand(11), business_id: 18, user_id: 2)
# Card.create!(points: rand(11), business_id: 19, user_id: 3)
# Card.create!(points: rand(11), business_id: 20, user_id: 4)

puts "The seed is complete"
