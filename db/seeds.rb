# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Dickson", last_name: "Goh", contact: 12345678, email: 'dicksongoh@gmail.com', password: 'keepsakes', usertype: 'Caregiver')
User.create(first_name: "Richard", last_name: "Really", contact: 77777777, email: 'thatssad@gmail.com', password: 'wahwahwah', usertype: 'Caregiver')
User.create(first_name: "Cinderelly", last_name: "Rella", contact: 12345678, email: 'fairygodmother@gmail.com', password: 'pumpkin', usertype: 'Caregiver')
Caregiver.create(user_id: 1, gender: 'male', certification: 'something',languages: 'new', specialties: 'signing', yearsofexperience: '8', experiencedescription: 'howhowhow', photo: 'helphelphelp')
Caregiver.create(user_id: 2, gender: 'male', certification: 'certifed uncertified',languages: 'anglais', specialties: 'lying', yearsofexperience: '8', experiencedescription: 'meowwww', photo: 'urghhhhh')
Caregiver.create(user_id: 3, gender: 'female', certification: 'certifed uncertified',languages: 'anglais', specialties: 'lying', yearsofexperience: '8', experiencedescription: 'meowwww', photo: 'urghhhhh')

User.update(id: 8, usertype: 'Caregiver')
8	weird	weirdshit	yellow@mellow.com	$2a$10$.3Nz50ZdI5.qgaeZj4gNQOB5NAM6QbCOq3N85WKsKAmyXQAU9degS	97418162		2017-02-14 01:52:08.345447	2017-02-14 01:52:08.345447

User.second.update(first_name: "Realname", last_name: "Name", contact: 88888888, email: 'realname@gmail.com', password: 'lieslieslies')
User.second.caregiver.update(gender: 'female', certification: 'something',languages: 'new', specialties: 'signing', yearsofexperience: '8', experiencedescription: 'howhowhow', photo: 'helphelphelp')
Caregiver.update(user_id: 2, gender: 'unknownnnnn', certification: 'something',languages: 'new', specialties: 'signing', yearsofexperience: '8', experiencedescription: 'howhowhow', photo: 'helphelphelp')
# User.destroy(id: 3)
# User.all

User.create(first_name: "Fam1", last_name: "1", contact: 12345678, email: 'lifesucks@gmail.com', password: 'keepsakes', usertype: 'Fammember')
User.create(first_name: "Fam2", last_name: "2", contact: 77777777, email: 'takedrugs@gmail.com', password: 'eheheheehe', usertype: 'Fammember')
User.create(first_name: "Fam3", last_name: "3", contact: 12345678, email: 'veryverystrange@gmail.com', password: 'hohohoho', usertype: 'Fammember')
Fammember.create(user_id: 4)
Fammember.create(user_id: 5)
Fammember.create(user_id: 6)

# User.fourth.update(first_name: "Realname", last_name: "Name", contact: 88888888, email: 'realname@gmail.com', password: 'lieslieslies', usertype: 'Fammember')
# User.sixth.fammember.update(gender: 'female', certification: 'something',languages: 'new', specialties: 'signing', yearsofexperience: '8', experiencedescription: 'howhowhow', photo: 'helphelphelp')


# this was how i populated polymorphic tables previously...

# Patient.first.languages.create!(name: 'english')
# Patient.second.languages.create!(name: 'chinese')
#
# Caregiver.first.languages.create!(name: 'tamil')
#
# Patient.first.frequencies.create!(name: 'daily')
# Patient.second.frequencies.create!(name: 'monthly')
#
# Caregiver.first.frequencies.create!(name: 'weekly')
