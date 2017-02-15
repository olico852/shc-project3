class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)

      if @patient.save
        redirect_to patients_path, notice: "Your profile has been sucessfully created"
      else
        redirect_to :back, notice: "Error..."
      end
  end

  def update
    @patient = patient.update(patient_params)
    redirect_to patient_path
  end

  def destroy
    @patient.destroy
    redirect_to '/', notice: "Your account has been successfully deleted."
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])

  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :address, :gender, :frequency, :condition_description)
  end
end
