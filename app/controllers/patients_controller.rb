class PatientsController < ApplicationController
# creating a new index method after generating the patients like so
  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    @patient = Patient.find(params[:id])
    render json: @patient
  end
end
