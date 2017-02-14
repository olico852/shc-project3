class Review < ApplicationRecord
  belongs_to :caregiver
  belongs_to :fammember
  belongs_to :reviewable, polymorphic: true
end
