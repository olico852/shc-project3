class Fammember < ApplicationRecord
  belongs_to :users
  # has_many :users, as: :usertypes --> DELETE
  has_many :patients
  has_many :reviews , as: :reviewable, dependent: :destroy

end
