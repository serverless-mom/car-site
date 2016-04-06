class PeopleController < ApplicationController
  def index
    @household = Household.find(params[:household_id])
    @people = @household.people
    render json: @people
  end
  
  def show
  end
  
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Household was successfully created.' }
        format.json {  render json: @person, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:last_name, :first_name, :email, :age, :household_id)
  end
end
