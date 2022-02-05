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

20.times do
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
  Business.create!(name: Faker::Restaurant.name, address: Faker::Address.full_address, category_id: rand(1..10), user_id: rand(1..4))
end

puts "Creating 20 reward mechanism..."

RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 1)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 2)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 3)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 4)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 5)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 6)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 7)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 8)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 9)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 10)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 11)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 12)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 13)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 14)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 15)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 16)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 17)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 18)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 19)
RewardMechanism.create!(counter: 10, discount: 'Free booze', minimum_purchase: 15, business_id: 20)

puts "Creating 20 cards..."

Card.create!(points: rand(11), business_id: 1, user_id: 1)
Card.create!(points: rand(11), business_id: 2, user_id: 2)
Card.create!(points: rand(11), business_id: 3, user_id: 3)
Card.create!(points: rand(11), business_id: 4, user_id: 4)
Card.create!(points: rand(11), business_id: 5, user_id: 1)
Card.create!(points: rand(11), business_id: 6, user_id: 2)
Card.create!(points: rand(11), business_id: 7, user_id: 3)
Card.create!(points: rand(11), business_id: 8, user_id: 4)
Card.create!(points: rand(11), business_id: 9, user_id: 1)
Card.create!(points: rand(11), business_id: 10, user_id: 2)
Card.create!(points: rand(11), business_id: 11, user_id: 3)
Card.create!(points: rand(11), business_id: 12, user_id: 4)
Card.create!(points: rand(11), business_id: 13, user_id: 1)
Card.create!(points: rand(11), business_id: 14, user_id: 2)
Card.create!(points: rand(11), business_id: 15, user_id: 3)
Card.create!(points: rand(11), business_id: 16, user_id: 4)
Card.create!(points: rand(11), business_id: 17, user_id: 1)
Card.create!(points: rand(11), business_id: 18, user_id: 2)
Card.create!(points: rand(11), business_id: 19, user_id: 3)
Card.create!(points: rand(11), business_id: 20, user_id: 4)

puts "The seed is complete"
