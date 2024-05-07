# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true, first_name: 'Admin', last_name: 'User')
user1 = User.create!(email: 'user1@example.com', password: 'password', password_confirmation: 'password', first_name: 'John', last_name: 'Doe')
user2 = User.create!(email: 'user2@example.com', password: 'password', password_confirmation: 'password', first_name: 'Jane', last_name: 'Doe')

event1 = Event.create!(start_date: DateTime.now + 1.day, duration: 2, title: 'First Event', description: 'Awesome event', price: 10, location: 'Paris', admin_id: admin.id, user_id: user1.id, date: Date.today + 1.day)
event2 = Event.create!(start_date: DateTime.now + 3.days, duration: 4, title: 'Second Event', description: 'Another awesome event', price: 20, location: 'London', admin_id: admin.id, user_id: user2.id, date: Date.today + 3.days)

Attendance.create!(user_id: user1.id, event_id: event1.id)
Attendance.create!(user_id: user2.id, event_id: event1.id)
Attendance.create!(user_id: user1.id, event_id: event2.id)
Attendance.create!(user_id: user2.id, event_id: event2.id)
