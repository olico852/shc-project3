class CaregiversLocations < ApplicationRecord
  belongs_to :caregiver
  belongs_to :location
end
