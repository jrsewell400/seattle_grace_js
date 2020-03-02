require 'rails_helper'

RSpec.describe "Doctor Show Page", type: :feature do 
  describe " - when I visit a doctor's show page" do 
    it "then I the doctors information, the hospital the doctor works at, and the name of doctor's patients." do 
      hospital_1 = Hospital.create!(name: "Eskenazi Health")
      hospital_2 = Hospital.create!(name: "IU Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "Johns Hopkins")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")
      doctor_3 = hospital_2.doctors.create!(name: "Meg Stang", specialty: "Cardio", university: "CU Boulder")
      doctor_4 = hospital_2.doctors.create!(name: "Mike Dao", specialty: "Feet", university: "Yale")

      patient_1 = DoctorPatient.create(doctor: doctor_1, patient: patient_1)
      patient_2 = DoctorPatient.create(doctor: doctor_1, patient: patient_2)
      patient_3 = DoctorPatient.create(doctor: doctor_2, patient: patient_3)
      patient_4 = DoctorPatient.create(doctor: doctor_2, patient: patient_4)
      
      visit "/doctors/#{doctor_1.id}"

      expect(page).to 

    end 
  end 
end 