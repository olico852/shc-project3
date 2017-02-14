class Fammember < ApplicationRecord
  belongs_to :user

  # has_many :users, as: :usertypes --> DELETE

  has_many :patients

end
