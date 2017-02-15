class Language < ApplicationRecord
  has_and_belongs_to_many :caregivers

  validates :sglang, uniqueness: true
end
