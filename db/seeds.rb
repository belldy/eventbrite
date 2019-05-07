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
puts "Database destoyed"

20.times do
	user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Name.first_name+"@yopmail.com",
		 encrypted_password: Faker::String.random(8..10), description: Faker::Superhero.suffix)
end
puts "20 users created"

30.times do
	event = Event.create!(start_date: Faker::Date.forward(2), duration: rand(1..120)*5, title: Faker::Superhero.prefix,
		description: Faker::Lorem.sentences(7), price: rand(1..1000), location: Faker::Address.city, user_id: User.all.sample.id)
end
puts "30 events created"

40.times do
	rdv = Attendance.create!(stripe_costumer_id: Faker::String.random, user_id: User.all.sample.id, event_id: Event.all.sample.id)
end
puts "40 attendances created"
puts "Database created"
