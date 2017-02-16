class Caregiver < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :specialties
  after_initialize :defaultVal

  # attr_accessor :email, :password, :languages, :specialties... don't add this as there's conflict with rails in-built accessor methods,

  validates :gender, presence: true
  validates :yearsofexperience, presence: true


  def upload_file
  end

  def defaultVal
    self.certification = false if self.certification.nil?
  end
end
