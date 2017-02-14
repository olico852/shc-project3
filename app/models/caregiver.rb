class Caregiver < ApplicationRecord
  # has_many :conditions, as: :sconditions --> DELETE
  # has_many :users, as: :usertypes, dependent: :destroy --> DELETE
  # has_many :frequencies, as: :occurences, dependent: :destroy --> DELETE
  #has_many :locations, as: :geographies, dependent: :destroy
  # has_many :languages, as: :sglangs, dependent: :destroy

  belongs_to :user

  attr_accessor :email, :password
end
