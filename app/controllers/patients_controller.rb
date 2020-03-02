class PatientsController < ApplicationController 
  def index
    @patients = Patient.select('name').order('age')
  end
end 