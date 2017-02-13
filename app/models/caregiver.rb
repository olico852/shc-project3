class Caregiver < ApplicationRecord
<<<<<<< HEAD
  before_save {self.email = email.downcase}
  belongs_to :user
  # has_many :conditions, as: :sconditions --> DELETE
  # has_many :users, as: :usertypes, dependent: :destroy --> DELETE
  # has_many :frequencies, as: :occurences, dependent: :destroy --> DELETE
  #has_many :locations, as: :geographies, dependent: :destroy
  # has_many :languages, as: :sglangs, dependent: :destroy

=======
  
  belongs_to :user

  attr_accessor :email, :password

>>>>>>> dc16ac4b0a38872c11938348ec84f8fa5790f207
end
