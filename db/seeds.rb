# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all
puts "Database destroyed"

20.times do
	user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Name.first_name+"@yopmail.com",
		 password: Faker::String.random(8), description: Faker::Superhero.suffix)
end
puts "Users created"

15.times do
	event = Event.create!(start_date: Faker::Date.forward(2), duration: 15, title: Faker::Superhero.prefix,
		description: Faker::ChuckNorris.fact, price: rand(1...1000), location: Faker::Address.city)
end
puts "Events created"

# 40.times do
# 	attendance = Attendance.create!(stripe_costumer_id: Faker::String.random)
# end
# puts "Attendances created"
puts "Database created"
