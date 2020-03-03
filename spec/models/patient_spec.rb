require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end
end

describe "class methods" do
  it "#order_age" do 
    hospital_1 = Hospital.create!(name: "IU Health")

    doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
    doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")

    patient_1 = Patient.create!(name: "Nova", age: "70")
    patient_2 = Patient.create!(name: "Luna", age: "25")
    patient_3 = Patient.create!(name: "Ricard", age: "51")
    patient_4 = Patient.create!(name: "Carol", age: "50")

    doctor_1.patients << patient_1
    doctor_1.patients << patient_2
    doctor_1.patients << patient_3
    doctor_1.patients << patient_4

    # DoctorPatient.create!(doctor: doctor_1, patient: patient_1)
    # DoctorPatient.create!(doctor: doctor_1, patient: patient_2)
    # DoctorPatient.create!(doctor: doctor_1, patient: patient_3)
    # DoctorPatient.create!(doctor: doctor_1, patient: patient_4)

    expect(Patient.order_age).to eq([patient_1, patient_3, patient_4, patient_2])
  end 
end

