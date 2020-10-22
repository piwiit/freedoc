# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
City.destroy_all
# Specialty.destroy_all

doctors = []
patients = []
cities = []
# specialties = []

spes = %w[Allergist Anesthesiologist Cardiologist Dermatologist Endocrinologist Gastroenterologist Hematologist Immunologist Internist]

# spes.each do |specialty|
#   spe = Specialty.create(name: specialty)
#   specialties << spe
# end

10.times do
  city = City.create(name: Faker::Address.city)
  cities << city
end

30.times do
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, specialty: spes.sample, city: cities.sample)
  patient =  Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cities.sample)
  doctors << doctor
  patients << patient
end

30.times do
  Appointment.create(doctor: doctors.sample, patient: patients.sample, date: Faker::Date.between(from: '2020-11-01', to: '2020-12-01'), city: cities.sample)
  # doctor_specialty = DoctorSpecialty.create(doctor: doctors.sample, specialty: specialties.sample)
end
