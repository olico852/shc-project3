class Fammember < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  # has_many :users, as: :usertypes --> DELETE
=======
>>>>>>> dc16ac4b0a38872c11938348ec84f8fa5790f207
  has_many :patients

end
