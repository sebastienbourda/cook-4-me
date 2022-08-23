# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# ============= Delete DB =======================

Booking.destroy_all
puts "  --> Bookings deleted"
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
url_users = '/app/assets/images/users'
first_names_users = %w[austin brooke jack stefan]
first_names_chefs = %w[alexander jane philip akachi]

# Create 4 "standard" users
4.times do |i|
  user = User.new(
    first_name: first_names_users[i],
    last_name: 'aniel',
    email: "#{first_names_users[i]}@cook4me.com",
    password: "secret",
    photo_url: "#{url_users}/#{first_names_users[i]}.jpg",
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
    photo_url: "#{url_users}/chefs/#{first_names_chefs[i]}.jpg",
    chef: true,
    chef_location: "Bordeaux"
  )
  user.save!
  puts "  --> User created"
end

# =============== Create Offers for Chef =====================

url_offers = '/app/assets/images/offers'

all_menus_names = %w[ beef brunch chicken chickpea\ bowl fish for\ two
                      libanese pasta pizza simple\ bowl sushis thai veggy\ brunch veggy ]

puts "> Create offers for Chefs"
all_chefs = User.where(chef: true)

all_chefs.each_with_index do |chef, index|
  offer = Offer.new(
    title: all_menus_names[index],
    category: Faker::Food.ethnic_category,
    price_per_person: rand(10..15),
    photo_url: "#{url_offers}/#{all_menus_names[index]}.jpg"
  )
  offer.user = chef
  offer.save!
  puts "  --> #{offer.title} created"
end

puts "> LOG WITH: austin@cook4me.com   / password: secret"

# =============== Create Meals for Chef =====================

all_offers = Offer.all
url_meals = '/app/assets/images/meals'
all_meals_names = %w[soup beef brownie]

all_offers.each do |offer|
  3.times do |i|
    meal = Meal.new(
      name: all_meals_names[i],
      category: Faker::Food.ethnic_category,
      ingredients: [Faker::Food.ingredient, Faker::Food.vegetables, Faker::Food.fruits, Faker::Food.spice],
      photo_url: "#{url_meals}/#{all_meals_names[i]}.jpg"
    )
    meal.user = offer.user
    meal.offer = offer
    meal.save!
    puts "    --> #{meal.name} created and added to #{offer.title}"
  end
end
