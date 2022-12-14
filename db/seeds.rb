# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# ============= Delete DB =======================
puts "> Delete Offer_meal"
OfferMeal.destroy_all
puts "  --> Offer_meal deleted"
puts "> Delete Reviews"
Review.destroy_all
puts "  --> Review deleted"
puts "> Delete Bookings"
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
    address: ""
  )
  user.save!
  puts "  --> User created"
end

url_offers = '/app/assets/images/offers'

all_menus_names = %w[ beef brunch chicken chickpea\ bowl fish for\ two
                      libanese pasta pizza simple\ bowl sushis thai veggy\ brunch veggy ]

# Create 4 "Chef" users and offers for each
4.times do |i|
  user = User.new(
    first_name: first_names_chefs[i].capitalize,
    last_name: 'aniel',
    email: "#{first_names_chefs[i]}@cook4me.com",
    password: "secret",
    photo_url: "#{url_users}/#{first_names_chefs[i]}.jpg",
    chef: true,
    address: Faker::Address.full_address
  )
  user.save!
  puts "  --> Chef created"
  all_menus_names.each do |menu|
    offer = Offer.new(
      title: menu.capitalize,
      category: Faker::Food.ethnic_category,
      price_per_person: rand(10..15),
      photo_url: "#{url_offers}/#{menu}.jpg"
    )
    offer.user = user
    offer.save!
    puts "     --> #{offer.title} created"
  end
end

puts "> LOG WITH: austin@cook4me.com   / password: secret"

# Create meals and bookings for offers

all_offers = Offer.all
url_meals = '/app/assets/images/meals'
all_meals_names = %w[soup beef brownie]

all_offers.each do |offer|
  3.times do |i|
    meal_offer = OfferMeal.new
    meal = Meal.new(
      name: all_meals_names[i].capitalize,
      category: Meal::CATEGORIES.sample,
      ingredients: [Faker::Food.ingredient, Faker::Food.vegetables, Faker::Food.fruits, Faker::Food.spice],
      photo_url: "#{url_meals}/#{all_meals_names[i]}.jpg"
    )
    meal.user = offer.user
    meal.save!
    meal_offer.offer = offer
    meal_offer.meal = meal
    meal_offer.save!
    puts "    --> #{meal.name} created and added to #{offer.title}"
  end

  booking = Booking.new(
    date: Faker::Date.between(from: Date.today, to: '2022-12-25'),
    comments: "On va avoir tr??s faim",
    number_of_guests: rand(2..10),
    status: 0
  )
  booking.offer = offer
  booking.user = User.find_by(first_name: %w[austin brooke jack stefan].sample)
  booking.save!
  puts "    --> Booking created and added to #{offer.title}"
  review = Review.new(
    rating: rand(1..5),
    comment: Faker::Restaurant.review
  )
  review.booking = booking
  review.save!
  puts "       --> Review added to this booking"
end
