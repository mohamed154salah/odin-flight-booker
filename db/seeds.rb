# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#require "faker"
require_relative '../lib/populator_fix.rb'

# 10.times do
#   Airport.create([{  name: Faker::Travel::Airport.unique.name }])
# end
Airport.populate 10 do |u|
  u.name = Faker::Travel::Airport.unique.name(size: 'large', region: 'united_states')
  u.code = Faker::Travel::Airport.iata(size: 'large', region: 'united_states')
  u.city = Faker::Address.city
end

Flight.populate 20 do |u|
  u.start_date = Faker::Time.between(from: '2023-01-23', to: '2023-09-25')
  u.duration = Faker::Number.between(from: 1, to: 10)
  u.departure_airport_id = Faker::Number.between(from: 1, to: 10)
  u.arrival_airport_id = Faker::Number.between(from: 1, to: 10)
end

# 20.times do
#   Flight.create([{ start_date: Faker::Time.between(from: '2023-01-23', to: '2023-09-25'), duration: Faker::Number.between(from: 1, to: 10), departure_airport_id: Faker::Number.between(from: 1, to: 10), arrival_airport_id: Faker::Number.between(from: 1, to: 10) }])
# end
