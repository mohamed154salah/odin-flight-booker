class PassengerBooking < ApplicationRecord
  belongs_to :passengers ,class_name:"Passenger" ,foreign_key: "passengers_id"
  belongs_to :bookings ,class_name:"Booking" ,foreign_key: "bookings_id"
end
