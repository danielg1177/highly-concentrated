require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating flower seeds"

USERS = [
  { email: "dg1@gmail.com", password: "123456"},
  { email: "dg2@gmail.com", password: "123456"},
  { email: "dg3@gmail.com", password: "123456"},
  { email: "dg4@gmail.com", password: "123456"},
]
USERS.each do |user_params|
  User.create!(user_params)
end
file = URI.open('https://images.unsplash.com/photo-1603909223429-69bb7101f420?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHdlZWR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')

i = 0

20.times do
  ganja = Ganja.new(name: Faker::Cannabis.brand, strain: Faker::Cannabis.strain, description: "A #{Faker::Cannabis.type} that #{Faker::Cannabis.health_benefit}", unit_price: rand(10..100), variety: "flower", pickup_local: Faker::Nation.capital_city, user_id: rand(1..4))
  ganja.photo.attach(io: file, filename: "nes#{i}.png", content_type: 'image/png')
  ganja.save
  i += 1
end

puts "Finished creating flower seeds"


puts "Creating edible seeds"

file = URI.open('https://images.unsplash.com/photo-1616645169694-37295f54d979?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJyb3duaWV8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')

20.times do
  ganja = Ganja.new(name: Faker::Cannabis.brand, strain: Faker::Cannabis.strain, description: "A #{Faker::Cannabis.type} that #{Faker::Cannabis.health_benefit}", unit_price: rand(10..100), variety: "edible", pickup_local: Faker::Nation.capital_city, user_id: rand(1..4))
  ganja.photo.attach(io: file, filename: "nes#{i}.png", content_type: 'image/png')
  ganja.save
  i += 1
end

puts "Finished creating edible seeds"

10.times do
  PurchaseRequest.create!(user_id: rand(1..4), ganja_id: rand(1..40), status: 'pending', pickup_time: '12:00')
end

10.times do
  PurchaseRequest.create!(user_id: rand(1..4), ganja_id: rand(1..40), status: 'accepted', pickup_time: '12:00')
end

10.times do
  PurchaseRequest.create!(user_id: rand(1..4), ganja_id: rand(1..40), status: 'declined', pickup_time: '12:00')
end

