class DoctorsController < ApplicationController 
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy 
    doctor = Doctor.find(params[:id])
    binding.pry
    doctor.patients.join(:doctor_patients).find(params[:patient_id]).destroy
    redirect_to doctor_path
  end 
end 