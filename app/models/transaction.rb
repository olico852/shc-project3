class Transaction < ApplicationRecord

  belongs_to :user
  belongs_to :caregiver
  has_many :reviews



end
