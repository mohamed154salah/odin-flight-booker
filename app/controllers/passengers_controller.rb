class PassengersController < ApplicationController
  def create
    @passenger = Passenger.new(passengers_params)
    if @passenger.save
      flash[:success] = "Passenger created!"
      redirect_to root_path
    else
      flash[:danger] = "Passenger not created!"
      render :new
    end
  end
  private
  def passengers_params
    params.require(:passenger).permit(:name, :email)
  end
end
