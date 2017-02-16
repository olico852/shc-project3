class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated_fammember, only: [:new, :update, :destroy, :edit]


  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @fammember = Fammember.find_by(user_id: params[:fammember_id])

    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)


    @patient['fammember_id'] = Fammember.find_by(user_id: params[:fammember_id]).id
      if @patient.save

        flash[:success] = "Your patient has been sucessfully created"
        redirect_to fammember_path(current_user.id)

      else
        flash[:danger] = "Error..."
        redirect_to :back
      end
  end

  def update
    @patient = patient.update(patient_params)
    redirect_to patient_path
  end

  def destroy
    @patient.destroy
    flash[:success] = "patient has been successfully deleted."
    redirect_to '/'
  end

  private


  def set_patient
    @patient = Patient.find(params[:id])
  end



  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :address, :gender, :frequency, :condition_description)
  end
end
