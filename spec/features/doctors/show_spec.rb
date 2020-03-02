require 'rails_helper'

RSpec.describe "Doctor Show Page", type: :feature do 
  describe " - when I visit a doctor's show page" do 
    it "then I the doctors information, the hospital the doctor works at, and the name of doctor's patients." do 
      hospital_1 = Hospital.create!(name: "IU Health")
      hospital_2 = Hospital.create!(name: "Eskenazi Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")
      doctor_3 = hospital_2.doctors.create!(name: "Meg Stang", specialty: "Cardio", university: "CU Boulder")
      doctor_4 = hospital_2.doctors.create!(name: "Mike Dao", specialty: "Feet", university: "Yale")

      patient_1 = Patient.create!(name: "Nova", age: "70")
      patient_2 = Patient.create!(name: "Luna", age: "25")
      patient_3 = Patient.create!(name: "Ricard", age: "51")
      patient_4 = Patient.create!(name: "Carol", age: "50")

      DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_3)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_4)
      
      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_content("Doctor Name: Jordan Sewell")
      expect(page).to have_content("Specialty: General")
      expect(page).to have_content("University: IU")
      expect(page).to have_content("Residency: IU Health")
      expect(page).to have_content("Patient: Nova")
      expect(page).to have_content("Patient: Luna")
    end 

    it "then, next to each patient's name, I see a button to remove that patient from that doctor's caseload." do 
      
      hospital_1 = Hospital.create!(name: "IU Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")

      patient_1 = Patient.create!(name: "Nova", age: "70")
      patient_2 = Patient.create!(name: "Luna", age: "25")
      patient_3 = Patient.create!(name: "Ricard", age: "51")
      patient_4 = Patient.create!(name: "Carol", age: "50")

      DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_3)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_4)

      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_button("Delete Patient")
      save_and_open_page
    end 

    it "when I click delete I'm brought back to the Doctor's show page, and I no longer see that patient's name listed." do 
      hospital_1 = Hospital.create!(name: "IU Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")

      patient_1 = Patient.create!(name: "Nova", age: "70")
      patient_2 = Patient.create!(name: "Luna", age: "25")
      patient_3 = Patient.create!(name: "Ricard", age: "51")
      patient_4 = Patient.create!(name: "Carol", age: "50")

      DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_3)
      DoctorPatient.create!(doctor: doctor_2, patient: patient_4)

      visit "/doctors/#{doctor_1.id}"

      within "#patient-#{patient_1.id}" do
        click_on "Delete Patient"
      end

      expect(current_path).to eq(doctor_path)
      expect(page).to_not have_content(patient_1.name)
    end 
  end 
end 

# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed 