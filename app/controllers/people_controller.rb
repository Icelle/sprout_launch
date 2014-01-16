class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @persons = Person.all
    gon.weight_data = fetch_all_people_data("weight")
    gon.height_data = fetch_all_people_data("height")
  end

  def new
    @person = Person.new
  end

  def show
    # TODO: handle when no data returned
    gon.weight_data = fetch_person_data("weight")
    gon.height_data = fetch_person_data("height")
  end

  def fetch_all_people_data(type)
    data = []
    people = current_user.people
    colors = gen_colors(people.size)

    people.each_with_index do |p, idx|
      data_points = p.fetch_graph_data(type)

      if !data_points.empty?
        data.push({
          color: colors[idx],
          data: data_points,
          name: "#{p.first_name + " " + p.last_name}"
          })
      end
    end
    return data
  end

  def fetch_person_data(type)
    data = []
    color = gen_colors(1)
    data.push({
      color: color,
      data: @person.fetch_graph_data(type),
      name: "#{@person.first_name + " " + @person.last_name}"
      })
    return data
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html{redirect_to new_person_path, notice: "Person was successfully recorded."}
      else
        format.html {render action: 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to  @person, notice: 'Person was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html{redirect_to person_url}
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
