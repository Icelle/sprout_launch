class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @persons = current_user.people
    gon.weight_data = current_user.fetch_children_graph("weight")
    gon.height_data = current_user.fetch_children_graph("height")
    gon.agemos = true
  end

  def new
    @person = Person.new
  end

  def show
    weight = @person.fetch_graph_with_national_avg("weight")
    height = @person.fetch_graph_with_national_avg("height")

    if !weight.nil?
      gon.weight_data = weight
    end

    if !height.nil?
      gon.height_data = height
    end
    # TODO: figure out how to add this as an after filter
    @gon = gon
    if session[:measurement]
      @measurement = Measurement.new(session[:measurement])
      @measurement.valid?
      session.delete(:measurement)
    else
      @measurement = Measurement.new({:person => @person, :as_of_dt => Date.today})
    end
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html{redirect_to new_person_path, notice: "Baby was successfully created."}
      else
        format.html {render action: 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to  @person, notice: 'Baby was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      if @person.destroy
        format.html{redirect_to people_path, notice: "Baby was successfully deleted."}
      else
        format.html {redirect_to people_path, error: "Baby was not deleted."}
      end
    end
  end

private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :gender, :birthday)
  end
end
