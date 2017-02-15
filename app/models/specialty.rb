class Specialty < ApplicationRecord
  has_and_belongs_to_many :caregivers

  validates :ability, uniqueness: true
end
