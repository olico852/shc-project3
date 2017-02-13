class Caregiver < ApplicationRecord
  before_save {self.email = email.downcase}
  belongs_to :users
  # has_many :conditions, as: :sconditions --> DELETE
  # has_many :users, as: :usertypes, dependent: :destroy --> DELETE
  # has_many :frequencies, as: :occurences, dependent: :destroy --> DELETE
  #has_many :locations, as: :geographies, dependent: :destroy
  # has_many :languages, as: :sglangs, dependent: :destroy




  searchable do
    integer :id
    text :first_name, boost: 5.0
    text :last_name, boost: 5.0
    integer :yearsofexperience
    text :experiencedescription
  end

end
