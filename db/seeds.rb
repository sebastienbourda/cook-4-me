# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "> Delete Users"
User.destroy_all
puts "> Users deleted"

puts "> Create Chef Simon user"
chef_simon = User.new(
  email: "chefsimon@grandchef.com",
  password: "secret"
)
chef_simon.save!
puts "> Chef Simon created"

puts "> Delete Offers"
Offer.destroy_all
puts "> Offers deleted"

puts "> Create offers for Chef Simon"

4.times do
  offer = Offer.new(
    title: Faker::Restaurant.type,
    category: Faker::Food.ethnic_category,
    price_per_person: rand(10..15)
  )
  offer.user = chef_simon
  offer.save!
  puts "#{offer.title} created"
end

puts "> offers created"
puts "> LOG WITH: chefsimon@grandchef.com    / password: secret"
