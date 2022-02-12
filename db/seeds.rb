# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Post.destroy_all
Chatroom.destroy_all
RewardMechanism.destroy_all
Card.destroy_all
Business.destroy_all
Category.destroy_all
User.destroy_all
Chatroom.create(name: "general")

puts "Creating 4 users..."
hannah = User.create!(email: 'hannah@test.com', password: 'hannah', code: "hannah")
victor = User.create!(email: 'victor@test.com', password: 'victor', code: "victor")
matthew = User.create!(email: 'matthew@test.com', password: 'matthew', code: "matthew")
davide = User.create!(email: 'davide@test.com', password: 'davide', code: "davide")

puts "Creating 10 categories..."

fast_food = Category.create!(category: "fast-food")
deli = Category.create!(category: "deli")
wine_shop = Category.create!(category: "wine shop")
fishmonger = Category.create!(category: "fishmonger")
cheesemonger = Category.create!(category: "cheesemonger")
bakery = Category.create!(category: "bakery")
greengrocer = Category.create!(category: "greengrocer")
coffee_shop = Category.create!(category: "coffee shop")
tea_room = Category.create!(category: "tea-room")
butcher = Category.create!(category: "butcher")

puts "Creating 20 businesses..."

business1 = Business.create!(
  name: "Surpriz ",
  description: "Restaurant animé servant des döner kebabs façon berlinoise au poulet, dans un espace simple et accueillant.",
  address: "110 Rue Oberkampf, 75011 Paris",
  category_id: fast_food.id,
  user_id: davide.id
)

business1.photo.attach(io: File.open("app/assets/images/surpriz.jpeg"), filename: "surpriz.jpeg", content_type: "image/jpeg")

puts 'created business 1'

business2 = Business.create!(
  name: "GangNam Falafel",
  description: "Les saveurs du Gangnam Falafel Bowl parlent plusieurs langues et surtout la vôtre : falafels, feuilles de vigne, salade, riz nature avec quinoa ...",
  address: "92 Rue Saint-Maur, 75011 Paris",
  category_id: fast_food.id,
  user_id: davide.id
)

business2.photo.attach(io: File.open("app/assets/images/gangnam_falafel.jpeg"), filename: "gangnam_falafel.jpeg", content_type: "image/jpeg")

business3 = Business.create!(
  name: "James Bún Oberkampf",
  description: "James Bun vous accueille dans un décor coloré et animé. Au menu, Bo Bun, sandwich Banh Mi et traditionnelle soupe Pho…",
  address: "126 Rue Oberkampf, 75011 Paris",
  category_id: fast_food.id,
  user_id: davide.id
)

business3.photo.attach(io: File.open("app/assets/images/jamesbun.jpeg"), filename: "jamesbun.jpeg", content_type: "image/jpeg")

business4 = Business.create!(
  name: "The Beans on Fire",
  description: "Café lumineux décoré de bois clair servant des expressos et des plats légers, avec vente de café en grains torréfié sur place.
",
  address: "7 Rue du Général Blaise, 75011 Paris",
  category_id: coffee_shop.id,
  user_id: davide.id
)

business4.photo.attach(io: File.open("app/assets/images/beansonfire.jpeg"), filename: "beansonfire.jpeg", content_type: "image/jpeg")

business5 = Business.create!(
  name: "Raftel Coffee Shop
",
  description: "Tartines délicieuses et cafés venus d'ailleurs. Voyagez en dehors de Paris le temps d'une pause café'.
",
  address: "16 Vla Gaudelet, 75011 Paris",
  category_id: coffee_shop.id,
  user_id: davide.id
)

business5.photo.attach(io: File.open("app/assets/images/raftel.jpeg"), filename: "raftel.jpeg", content_type: "image/jpeg")

business6 = Business.create!(
  name: "Broken Biscuits Coffee Shop",
  description: "Deux petits comptoirs et quelques tabourets, histoire de déguster sur place les créations du jour en admirant Christine confectionner sandwiches et carrot cakes.deux petits comptoirs et quelques tabourets, histoire de déguster sur place les créations du jour en admirant Christine confectionner sandwiches et carrot cakes.'.
",
  address: "10 Pass. Rochebrune, 75011 Paris",
  category_id: coffee_shop.id,
  user_id: davide.id
)

business6.photo.attach(io: File.open("app/assets/images/broken_biscuit.jpeg"), filename: "broken_biscuit.jpeg", content_type: "image/jpeg")

business7 = Business.create!(
  name: "Boucherie Dagault",
  description: "La Boucherie Dagault, c'est un rayon traiteur : crudités, fromages... · Des plats cuisinés artisanaux : purée, lasagnes, gratin dauphinois, épinards à la ...
'.
",
  address: "94 Rue Oberkampf, 75011 Paris",
  category_id: butcher.id,
  user_id: davide.id
)

business7.photo.attach(io: File.open("app/assets/images/boucherie.png"), filename: "boucherie.png", content_type: "image/png")


business8 = Business.create!(
  name: "Boucherie Imazighen",
  description: "La Boucherie Imazighen, vous propose d'incroyables viandes. Boeuf de kobé, Waygu, Charolaise...
'.
",
  address: "7 Rue de Ménilmontant, 75020 Paris",
  category_id: butcher.id,
  user_id: davide.id
)

business8.photo.attach(io: File.open("app/assets/images/beef.jpeg"), filename: "boucherie.jpeg", content_type: "image/jpeg")



puts "Creating 20 reward mechanism..."

RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business1.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business2.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business3.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business4.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business5.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business6.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business7.id)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business8.id)
#RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business9.id)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business10)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business11)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business12)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business13)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business14)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business15)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business16)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business17)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business18)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business19)
# RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: business20)

puts "Creating 20 cards..."

Card.create!(points: rand(11), business_id: business1.id, user_id: hannah.id)
Card.create!(points: rand(11), business_id: business2.id, user_id: victor.id)
Card.create!(points: rand(11), business_id: business3.id, user_id: davide.id)
Card.create!(points: rand(11), business_id: business4.id, user_id: davide.id)
Card.create!(points: rand(11), business_id: business5.id, user_id: hannah.id)
Card.create!(points: rand(11), business_id: business6.id, user_id: victor.id)
Card.create!(points: rand(11), business_id: business7.id, user_id: matthew.id)
Card.create!(points: rand(11), business_id: business8.id, user_id: davide.id)
#Card.create!(points: rand(11), business_id: business9, user_id: hannah)
# Card.create!(points: rand(11), business_id: business10, user_id: victor)
# Card.create!(points: rand(11), business_id: business11, user_id: matthew)
# Card.create!(points: rand(11), business_id: business12, user_id: davide)
# Card.create!(points: rand(11), business_id: business13, user_id: 1)
# Card.create!(points: rand(11), business_id: business14, user_id: victor)
# Card.create!(points: rand(11), business_id: business15, user_id: matthew)
# Card.create!(points: rand(11), business_id: business16, user_id: davide)
# Card.create!(points: rand(11), business_id: business17, user_id: 1)
# Card.create!(points: rand(11), business_id: business18, user_id: 2)
# Card.create!(points: rand(11), business_id: business19, user_id: matthew)
# Card.create!(points: rand(11), business_id: business20, user_id: davide)

puts "The seed is complete"
