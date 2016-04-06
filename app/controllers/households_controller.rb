class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  # GET /households
  # GET /households.json
  def index
    @households = Household.all
    render json: @households
  end

  # GET /households/1
  # GET /households/1.json
  def show
  end

  # GET /households/new
  def new
    @household = Household.new
  end

  # GET /households/1/edit
  def edit
  end

  # POST /households
  # POST /households.json
  def create
    @household = Household.new(household_params)

    respond_to do |format|
      if @household.save
        format.html { redirect_to @household, notice: 'Household was successfully created.' }
        format.json { render :show, status: :created, location: @household }
      else
        format.html { render :new }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_household
    @household = Household.find(params[:id])
  end

  # Never trust parameters from the internet, only allow the white list through.
  def household_params
    params.require(:household).permit(:address, :city, :state, :number_of_bedrooms, :zip)
  end
end
