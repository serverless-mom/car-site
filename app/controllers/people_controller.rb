class PeopleController < ApplicationController
  def index
    @people = Person.all
    render json: @people
  end
  def new
  end
end
