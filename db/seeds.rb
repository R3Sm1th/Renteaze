# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "date"

puts "cleaning your db.....:)"
Property.destroy_all

puts "cleaning your db...."
User.destroy_all

# Users
user1 = User.new
user1.first_name = "Russell"
user1.surname = "Smith"
user1.email = "russell@gmail.com"
user1.password = "ilovemyteam"
user1.contact_number = "07447862458"
user1.current_address = "Brighton"
user1.save!

user2 = User.new
user2.first_name = "Clement"
user2.surname = "Carr"
user2.email = "clementino@gmail.com"
user2.password = "ilovemyteam"
user2.contact_number = "07447432453"
user2.current_address = "Paris"
user2.save!

user3 = User.new
user3.first_name = "Victor"
user3.surname = "Isopescu"
user3.email = "victor@gmail.com"
user3.password = "ilovemyteam"
user3.contact_number = "07447432452"
user3.current_address = "Coventry"
user3.save!

user4 = User.new
user4.first_name = "Tony"
user4.surname = "Chen"
user4.email = "tony@gmail.com"
user4.password = "ilovemyteam"
user4.contact_number = "7447432451"
user4.current_address = "Taiwan"
user4.save!

puts "creating buildings...."

property1 = {number: 2, street: "Wigan Road", town: "Manchester", postcode: "WN23BE", price_per_month: 650, availability_date: Date.new(2023,8,17), user: user1}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686660764/1_-_01_rnuov7.jpg")
property1 = Property.new(property1)
property1.photo.attach(io: file, filename: "1_-_01_rnuov7.jpg", content_type: "image/jpg")
property1.save

property2 = {number: 23, street: "Spring Vale Turton", town: "Bolton", postcode: "BL70FS", price_per_month: 850, availability_date: Date.new(2023,7,14), user: user1}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686661264/2-01_edwyd9.jpg")
property2 = Property.new(property2)
property2.photo.attach(io: file, filename: "2-_01_edwyd9.jpg", content_type: "image/jpg")
property2.save

property3 = {number: 67, street: "Hulme", town: "Manchester", postcode: "M15GG", price_per_month: 1450, availability_date: Date.new(2023,7,24), user: user2}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686661635/3.01_jygyrj.jpg")
property3 = Property.new(property3)
property3.photo.attach(io: file, filename: "3.01_jygyrj.jpg", content_type: "image/jpg")
property3.save

property4 = {number: 5, street: "Congleton Road", town: "Alderley Edge", postcode: "SK97AQ", price_per_month: 2400, availability_date: Date.new(2023,9,16), user: user2}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686661751/4-01_crraym.jpg")
property4 = Property.new(property4)
property4.photo.attach(io: file, filename: "4-01_crraym.jpg", content_type: "image/jpg")
property4.save

property5 = {number: 2, street: "Stanhope Road", town: "Bowdon", postcode: "WA143LA", price_per_month: 1500, availability_date: Date.new(2023,8,6), user: user3}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686661975/5-01_uwrs5s.jpg")
property5 = Property.new(property5)
property5.photo.attach(io: file, filename: "5-01_uwrs5s.jpg", content_type: "image/jpg")
property5.save

property6 = {number: 154, street: "Macclesfield Road", town: "Wilmslow", postcode: "SK92AF", price_per_month: 1876, availability_date: Date.new(2023,10,18), user: user3}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686662121/6-01_n5gdk2.jpg")
property6 = Property.new(property6)
property6.photo.attach(io: file, filename: "6-01_n5gdk2.jpg", content_type: "image/jpg")
property6.save

property7 = {number: 100, street: "South Downs", town: "Bowdon", postcode: "WA143DR", price_per_month: 1750, availability_date: Date.new(2023-8-17), user: user3}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686662414/7-01_qqivmj.jpg")
property7 = Property.new(property7)
property7.photo.attach(io: file, filename: "7-01_qqivmj.jpg", content_type: "image/jpg")
property7.save

property8 = {number: 34, street: "Carrwood", town: "Hale Barns", postcode: "WA150EW", price_per_month: 2350, availability_date: Date.new(2023,8,17), user: user3}

file = URI.open("https://res.cloudinary.com/dbwm281qa/image/upload/v1686662615/8-01_sfulc5.jpg")
property8 = Property.new(property8)
property8.photo.attach(io: file, filename: "8-01_sfulc5.jpg", content_type: "image/jpg")
property8.save
