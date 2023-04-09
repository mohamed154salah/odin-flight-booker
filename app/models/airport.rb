class Airport < ApplicationRecord
  has_many :departure_airport , class_name: "Flight", foreign_key: "departure_airport_id"
  has_many :arrival_airport , class_name: "Flight", foreign_key: "arrival_airport_id"
end
