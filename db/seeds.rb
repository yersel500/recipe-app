# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Lilly', email: 'lilly@gmail.com', password: 'lilly12345', password_confirmation: 'lilly12345',
            confirmed_at: DateTime.now)

Food.create(user: User.first, name: 'apple', measurement_unit: 'un', price: 1)
Food.create(user: User.first, name: 'orange', measurement_unit: 'un', price: 2)
Food.create(user: User.first, name: 'papaya', measurement_unit: 'un', price: 3)
Food.create(user: User.first, name: 'banana', measurement_unit: 'un', price: 4)
