class AirportsController < ApplicationController

  def create
    @airport = Airport.new(airport_params)
    if @airport.save
      flash[:success] = "Airport created!"
    else
      flash[:danger] = "Airport not created!"
    end
  end

  private

  def airport_params
    params.require(:airport).permit(:code, :name, :city)
  end
end
