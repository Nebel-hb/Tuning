# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: "music@music.com", password: "000000")
User.create!(email: "musician1@music.com", password: "111111" ,role: 1)
User.create!(email: "musician2@music.com", password: "222222",role: 1)
User.create!(email: "orchestra1@music.com", password: "aaaaaa",role: 2)
User.create!(email: "orchestra2@music.com", password: "bbbbbb",role: 2)