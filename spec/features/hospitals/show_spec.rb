require 'rails_helper'

RSpec.describe "Hospital Show Page", type: :feature do 
  describe " - when I visit a hospital's show page" do 
    it "I see the hospital's name, the number of doctors that work at this hospital, and a unique list of universities that this hospital's doctors attended." do 
      hospital_1 = Hospital.create!(name: "IU Health")
      hospital_2 = Hospital.create!(name: "Eskenazi Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")
      doctor_3 = hospital_1.doctors.create!(name: "Meg Stang", specialty: "Cardio", university: "IU")

      patient_1 = Patient.create!(name: "Nova", age: "70")
      patient_2 = Patient.create!(name: "Luna", age: "25")
      patient_3 = Patient.create!(name: "Ricard", age: "51")
      patient_4 = Patient.create!(name: "Carol", age: "50")

      DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_3)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_4)

      visit "/hospitals/#{hospital_1.id}"

      expect(page).to have_content("IU Health")
      expect(page).to have_content("Number of Doctors: 3")
      
      within "#universities" do 
        expect(page).to have_content("IU")
        expect(page).to have_content("Brown")
      end 
    end 
  end 
end 
    
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
