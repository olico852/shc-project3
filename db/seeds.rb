# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Fammember.create(first_name: "Dickson", last_name: "Goh", contact: 12345678, email: 'dicksongoh@gmail.com', password: 'keepsakes')
Fammember.create(first_name: "Johnny", last_name: "Lam", contact: 90344525, email: "johnnylam@gmail.com", password: "yessire")

Patient.create(fammember_id: '1', first_name: 'Hello', last_name: 'Kitty', address: 'some place', gender: 'Female', condition_description: 'chronic pain. needs daily care' )
Fammember.first.patients.create(first_name: 'Number', last_name: '2', address: 'where to copy', gender: 'male', condition_description: 'chronic pain. needs more')


Patient.create(fammember_id: '1', first_name: 'Kitty', last_name: 'Hello', address: 'some place', gender: 'female', condition_description: 'coollll colllll ')


Patient.first.conditions.create!(name: 'General Care')
Patient.second.conditions.create!(name: 'General Care')

Caregiver.create(first_name: 'Dickson', last_name: 'Goh', contact: 12345678, email: 'objectivedom@gmail.com', password: 'keepsakes', gender: 'female', certification: 'true', yearsofexperience: 'chinese', experiencedescription: '8 years', photo: 'www.lnk.com')
Caregiver.create(first_name: 'caregiver', last_name: 'two', contact: 12345678, email: 'somethingelse@gmail.com', password: 'keepsakes', gender: 'male', certification: 'true', yearsofexperience: 'chinese', experiencedescription: '8 years', photo: 'www.lnk.com')

Caregiver.first.conditions.create!(name: 'Something else')

Patient.first.locations.create!(name: 'Yishun')
Patient.second.locations.create!(name: 'Tampines')

Caregiver.first.locations.create!(name: 'Marina')


Patient.first.languages.create!(name: 'english')
Patient.second.languages.create!(name: 'chinese')

Caregiver.first.languages.create!(name: 'tamil')

Patient.first.frequencies.create!(name: 'daily')
Patient.second.frequencies.create!(name: 'monthly')

Caregiver.first.frequencies.create!(name: 'weekly')
