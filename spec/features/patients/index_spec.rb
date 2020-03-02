require 'rails_helper'

RSpec.describe "Patient Index Page", type: :feature do 
  describe " - when I visit a patient's index page" do 
    it "then I the doctors information, the hospital the doctor works at, and the name of doctor's patients." do 
      hospital_1 = Hospital.create!(name: "IU Health")
      hospital_2 = Hospital.create!(name: "Eskenazi Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")
      doctor_3 = hospital_2.doctors.create!(name: "Meg Stang", specialty: "Cardio", university: "CU Boulder")
      doctor_4 = hospital_2.doctors.create!(name: "Mike Dao", specialty: "Feet", university: "Yale")

      patient_1 = Patient.create!(name: "Nova", age: "70")
      patient_2 = Patient.create!(name: "Luna", age: "25")
      patient_3 = Patient.create!(name: "Richard", age: "51")
      patient_4 = Patient.create!(name: "Carol", age: "50")

      DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_3)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_4)

      visit "/patients"

      within "#patients" do 
        expect(page.all('li')[0]).to have_content("Luna")
        expect(page.all('li')[1]).to have_content("Carol")
        expect(page.all('li')[2]).to have_content("Richard")
        expect(page.all('li')[3]).to have_content("Nova")
      end 
    end 
  end 
end 
