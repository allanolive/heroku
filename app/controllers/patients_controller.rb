class PatientsController < ApplicationController
# creating a new index method after generating the patients like so
  def index
    @patients = Patient.all
    render json: @patients
  end
end
