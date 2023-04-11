class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end
  def new
    if params[:tickets].present?
      @booking = Booking.new(flights_id: params[:flights_id])
      params[:tickets].to_i.times { @booking.passengers.build }
      @flight = Flight.find(params[:flights_id])
    else
      flash[:danger] = "You must select at least one ticket"
      redirect_to root_path
    end

  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find(params[:booking][:flights_id])
    @booking.flight = @flight

    if @booking.save
      flash[:notice] = "Booking created!"
      redirect_to booking_path(@booking.id)
    else
      flash[:alert] = "Booking failed to create!, reason: #{@booking.errors.full_messages}"
      render :new
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:flights_id, passengers_attributes: [:name, :email])
  end
end
