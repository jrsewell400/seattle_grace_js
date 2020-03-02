# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
