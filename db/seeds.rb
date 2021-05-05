require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PurchaseRequest.destroy_all
Ganja.destroy_all
User.destroy_all
Chat.destroy_all



puts "Creating flower seeds"

USERS = [
  { email: "dg@gmail.com", password: "123456", first_name: "Daniel", last_name: "Gordon"},
  { email: "sa@gmail.com", password: "123456", first_name: "Shane", last_name: "Artsy"},
  { email: "hg@gmail.com", password: "123456", first_name: "Hugo", last_name: "Gurney"},
  { email: "mm@gmail.com", password: "123456", first_name: "Moshe", last_name: "Maman"},
]
USERS.each do |user_params|
  User.create!(user_params)
end

flower_images = ['https://images.unsplash.com/photo-1603909223429-69bb7101f420?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHdlZWR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1589140915708-20ff586fe767?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d2VlZHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1587094833283-91461ef370cc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8d2VlZHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1589305097354-41e9a563e3f4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDh8fHdlZWR8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1457573526299-599d0da92f88?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAxfHx3ZWVkfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1617336254861-6f92401be1c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHdlZWQlMjBidWR8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1598973728789-755b8338900f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHdlZWQlMjBidWR8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1583874513048-8c7401f32064?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fHdlZWQlMjBidWR8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1617176683304-5e6bad73f379?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjN8fHdlZWQlMjBidWR8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
]

20.times do
  file = URI.open(flower_images.sample)
  ganja = Ganja.new(name: Faker::Cannabis.brand, strain: Faker::Cannabis.strain, description: Faker::Cannabis.health_benefit, unit_price: rand(10..100), variety: "flower", pickup_local: "#{Faker::Address.street_address}, New York", user: User.all.sample)
  ganja.photo.attach(io: file, filename: "nes.png", content_type: 'image/png')
  if ganja.save
    puts "saved"
  else
    p ganja.errors.messages
  end
end

puts "Finished creating flower seeds"


puts "Creating edible seeds"

edible_images = ['https://images.unsplash.com/photo-1616645169694-37295f54d979?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJyb3duaWV8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1550617931-e17a7b70dce2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FrZXN8ZW58MHwwfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1509460711270-4affad6eef6a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y29va2llfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1464195244916-405fa0a82545?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNvb2tpZXxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1576852417985-4a347062b45e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNvb2tpZXxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1547097465-21d286cfd973?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3VtbXklMjBiZWFyfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
]

20.times do
  file = URI.open(edible_images.sample)
  ganja = Ganja.new(name: Faker::Cannabis.brand, strain: Faker::Cannabis.strain, description: Faker::Cannabis.health_benefit, unit_price: rand(10..100), variety: "edible", pickup_local: "#{Faker::Address.street_address}, New York", user: User.all.sample)
  ganja.photo.attach(io: file, filename: "nes.png", content_type: 'image/png')
  ganja.save
end

puts "Finished creating edible seeds"

10.times do
  PurchaseRequest.create!(user: User.all.sample, ganja: Ganja.all.sample, status: 'pending', pickup_time: DateTime.current)
end

10.times do
  PurchaseRequest.create!(user: User.all.sample, ganja: Ganja.all.sample, status: 'accepted', pickup_time: DateTime.current)
end

10.times do
  PurchaseRequest.create!(user: User.all.sample, ganja: Ganja.all.sample, status: 'declined')
end

