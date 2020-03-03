class DoctorPatientsController < ApplicationController 
  def destroy 
    DoctorPatient.find_by(patient_id: params[:patient_id], doctor_id: params[:doctor_id]).destroy
    redirect_to doctor_path(params[:doctor_id])
  end 
end 