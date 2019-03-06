class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show update destroy]
# creating a new index method after generating the patients like so
  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    # @patient = Patient.find(params[:id])
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

  def update
    # @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      render json: @patient, status: :created
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  def destroy
        # @patient = Patient.find(params[:id])
        @patient.destroy
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :born_on, :diagnosis, :doctor_id)
  end
end
