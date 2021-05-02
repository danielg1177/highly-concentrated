require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating flower seeds"

20.times do
  Ganja.create!(name: Faker::Cannabis.brand, strain: Faker::Cannabis.strain, description: "A #{Faker::Cannabis.type} that #{Faker::Cannabis.health_benefit}", unit_price: rand(10..100), variety: "Flower", pickup_local: Faker::Nation.capital_city, user_id: rand(1..3))
end

puts "Finished creating flower seeds"


puts "Creating edible seeds"

20.times do
  Ganja.create!(name: Faker::Cannabis.brand, strain: Faker::Cannabis.strain, description: "A #{Faker::Cannabis.type} that #{Faker::Cannabis.health_benefit}", unit_price: rand(10..100), variety: "Edible", pickup_local: Faker::Nation.capital_city, user_id: rand(1..3))
end

puts "Finished creating edible seeds"
