class Specialty < ApplicationRecord
  has_and_belongs_to_many :caregivers

  validates :ability, uniqueness: true

    attr_reader :ability, :id


end
