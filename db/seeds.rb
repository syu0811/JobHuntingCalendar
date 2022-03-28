# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "test@example.com", password: "password")
User.create(email: "guest@example.com", password: "password")

Company.create(name: "テスト株式会社", user: User.first, home_page_url: "https://www.home.com/", communication_url: "https://www.communication.com/")

Event.create(title: "テスト面接", year: 2022, month: 3, day: 31, hour: 7, minute: 0, url: "https://www.google.com/", user: User.first, company: Company.first)