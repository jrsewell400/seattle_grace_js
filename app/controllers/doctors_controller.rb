class DoctorsController < ApplicationController 
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy 
    doctor = Doctor.find(params[:id])
    binding.pry
    doctor.patients.find(id: params[:id]).destroy
    # doctor.patients.find_by(patient_id: params[:patient_id], doctor_id: params[:doctor_id]).destroy
    # patients = doctor.patients
    # #.find(params[:patient_id]).destroy
    redirect_to doctor_path
  end 
end 