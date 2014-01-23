class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [ :edit, :update, :destroy]

  def new
    @measurement = Measurement.new
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)
    # binding.pry
    respond_to do |format|
      if @measurement.save
        # format.html{ redirect_to person_path(params["person_id"]), notice: "Measurement was successfully added."}
        format.html{ redirect_to person_path(params["person_id"]), notice: "Measurement was successfully added."}
      else
        # format.html {redirect_to person_path(id: params["person_id"]), error: "Measurement was not successfully added."}
        # format.html { render {action: 'show', controller: 'people' }}
        # @person = Person.find params["person_id"]
        session[:measurement] = measurement_params
        format.html { redirect_to person_path(params["person_id"])}
      end
    end
  end

  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to  person_path(@measurement.person_id), notice: 'Measurement was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @measurement.destroy
    respond_to do |format|
      if @measurement.destroy
        format.html{redirect_to person_path(@measurement.person), notice: "Measurement was successfully deleted."}
      else
        format.html {redirect_to person_path(@measurement.person), error: "Measurement was not deleted."}
      end
    end
  end

private

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end

  def measurement_params
    m = params.require(:measurement).permit(:measurement_type, :value, :as_of_dt)
    if params["person_id"]
      m["person_id"] = params["person_id"]
    end
    m
  end
end
