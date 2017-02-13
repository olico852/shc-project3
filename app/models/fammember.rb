class Fammember < ApplicationRecord
  belongs_to :users
  # has_many :users, as: :usertypes --> DELETE
  has_many :patients

end
