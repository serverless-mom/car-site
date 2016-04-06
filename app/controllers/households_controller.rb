class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  def index
    @households = Household.all
    render json: @households
  end

  def show
  end

  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)

    respond_to do |format|
      if @household.save
        format.html { redirect_to @household, notice: 'Household was successfully created.' }
        format.json { render json: @household, status: :created, location: @household }
      else
        format.html { render :new }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def set_household
    @household = Household.find(params[:id])
  end

  def household_params
    params.require(:household).permit(:address, :city, :state, :number_of_bedrooms, :zip)
  end
end
