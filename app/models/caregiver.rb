class Caregiver < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :specialties

  attr_accessor :email, :password, :languages, :specialties

  validates :gender, presence: true
  validates :certification, presence: true
  validates :yearsofexperience, presence: true


  def upload_file
  end

end
