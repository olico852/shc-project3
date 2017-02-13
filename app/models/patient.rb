class Patient < ApplicationRecord
  belongs_to :fammember
  # has_many :conditions, as: :sconditions, dependent: :destroy
  # has_many :frequencies, as: :occurences, dependent: :destroy
  # has_many :locations, as: :geographies, dependent: :destroy
  # has_many :languages, as: :sglangs, dependent: :destroy


  searchable do
    integer :id
    text :condition_description
  end

end
