class FlightsController < ApplicationController

  def index
    @airports_options = Airport.all.map { |a| [a.name, a.id] }
    @flights = Flight.all
  end

  def find_flights
    @airports_options = Airport.all.map { |a| [a.name, a.id] }
    @f_flights = Flight.where(departure_airport_id: params[:departure_airport_id], arrival_airport_id: params[:arrival_airport_id])
    @f_flights= @f_flights.where("start_date >= ?", params[:start_date])
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      flash[:success] = "Flight created!"
    else
      flash[:danger] = "Flight not created!"
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:start_date, :duration, :departure_airport_id, :arrival_airport_id)
  end

end
