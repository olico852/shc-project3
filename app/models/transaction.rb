class Transaction < ApplicationRecord

  belongs_to :fammember
  belongs_to :caregiver
  belongs_to :patient

end
