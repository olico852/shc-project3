class Fammember < ApplicationRecord
  belongs_to :user
  has_many :patients
  has_many :reviews , as: :reviewable, dependent: :destroy

end
