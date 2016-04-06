class PeopleController < ApplicationController
  def index
    @person = Person.find(params[:person_id])
    @vehicles = @person.vehicles
    render json: @vehicles
  end
  def new
  end
end
