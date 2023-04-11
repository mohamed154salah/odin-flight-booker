class Booking < ApplicationRecord
  belongs_to :flight, foreign_key: 'flights_id'
  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers
  before_validation :find_or_create_passenger

  private

  def find_or_create_passenger
    self.passengers = passengers.map do |passenger|
      Passenger.find_or_create_by(name: passenger.name, email: passenger.email)
    end
  end

end
