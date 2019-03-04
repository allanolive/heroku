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

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      render json: @patient, status: :created
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :born_on, :diagnosis)
  end
end
