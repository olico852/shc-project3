class Caregiver < ApplicationRecord

  belongs_to :user

  attr_accessor :email, :password
  
end
