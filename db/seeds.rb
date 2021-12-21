# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name: "Muthomi", email: "1@2.com", password: "qwerty")
User.create!(name: "Titus", email: "1@3.com", password: "qwerty")
User.create!(name: "Kalunge", email: "1@4.com", password: "qwerty")
User.create!(name: "Dammy", email: "1@5.com", password: "qwerty")

User.second.foods.create!(name: "Mukimo", measurement_unit: "grams", price: 50)
User.last.foods.create!(name: "Chapati", measurement_unit: "grams", price: 150)
User.third.foods.create!(name: "Sugar", measurement_unit: "grams", price: 590)
User.second.foods.create!(name: "Karanga", measurement_unit: "grams", price: 5900)