class PeopleController < ApplicationController
  def index
    @household = Household.find(params[:household_id])
    @people = @household.people
    render json: @people
  end
  def new
  end
end
