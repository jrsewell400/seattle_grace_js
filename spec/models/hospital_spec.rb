require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
end

describe "instance methods" do 
  it "#total_doctors" do 
    hospital_1 = Hospital.create!(name: "IU Health")
    hospital_2 = Hospital.create!(name: "Eskenazi Health")

    doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
    doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")
    doctor_3 = hospital_1.doctors.create!(name: "Meg Stang", specialty: "Cardio", university: "CU Boulder")
    doctor_4 = hospital_2.doctors.create!(name: "Mike Dao", specialty: "Feet", university: "Yale")

    patient_1 = Patient.create!(name: "Nova", age: "70")
    patient_2 = Patient.create!(name: "Luna", age: "25")
    patient_3 = Patient.create!(name: "Ricard", age: "51")
    patient_4 = Patient.create!(name: "Carol", age: "50")

    DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
    DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
    DoctorPatient.create!(doctor: doctor_1, patient: patient_3)
    DoctorPatient.create!(doctor: doctor_2, patient: patient_4)

    expect(hospital_1.total_doctors).to eq(3)

  end
end 