# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "> Delete Meals"
Meal.destroy_all
puts "  --> Meals deleted"
puts "> Delete Offers"
Offer.destroy_all
puts "  --> Offers deleted"
puts "> Delete Users"
User.destroy_all
puts "  --> Users deleted"

# =============== Create Users =====================

puts "> Create Users"
url = '/app/assets/images/users'
first_names_users = %w[austin brooke jack stefan]
first_names_chefs = %w[alexander jane philip akachi]


# Create 4 "standard" users
4.times do |i|
  user = User.new(
    first_name: first_names_users[i],
    last_name: 'aniel',
    email: "#{first_names_users[i]}@cook4me.com",
    password: "secret",
    photo_url: "#{url}/#{first_names_users[i]}.jpg",
    chef: false,
    chef_location: ""
  )
  user.save!
  puts "  --> User created"
end


# Create 4 "Chef" users
4.times do |i|
  user = User.new(
    first_name: first_names_chefs[i],
    last_name: 'aniel',
    email: "#{first_names_chefs[i]}@cook4me.com",
    password: "secret",
    photo_url: "#{url}/chefs/#{first_names_chefs[i]}.jpg",
    chef: true,
    chef_location: "Bordeaux"
  )
  user.save!
  puts "  --> User created"
end



# =============== Create Offers for Chef =====================

# puts "> Create offers for Chef Simon"
# 4.times do
#   offer = Offer.new(
#     title: Faker::Restaurant.type,
#     category: Faker::Food.ethnic_category,
#     price_per_person: rand(10..15)
#   )
#   offer.user = chef_simon
#   offer.save!
#   puts "  --> #{offer.title} created"
#   3.times do
#     meal = Meal.new(
#       name: Faker::Food.dish,
#       category: Faker::Food.ethnic_category,
#       ingredients: [Faker::Food.ingredient, Faker::Food.vegetables, Faker::Food.fruits, Faker::Food.spice]
#     )
#     meal.user = chef_simon
#     meal.offer = offer
#     meal.save!
#     puts "    --> #{meal.name} created and added to #{offer.title}"
#   end
# end

# puts "> LOG WITH: chefsimon@grandchef.com    / password: secret"
