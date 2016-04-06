class VehiclesController < ApplicationController
  def index
    @person = Person.find(params[:person_id])
    @vehicles = @person.vehicles
    render json: @vehicles
  end
  def new
  end
  def show
  end
  
  def create
    @vehicle = Vehicle.new(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:license, :make, :model, :year, :person_id)
  end
end
