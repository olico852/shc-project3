class Caregiver < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :specialties
  after_initialize :defaultVal

  validates :gender, presence: true
  validates :yearsofexperience, presence: true


  def upload_file
  end

  def defaultVal
    self.certification = false if self.certification.nil?
  end
end
