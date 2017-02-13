class User < ApplicationRecord
  has_one :fammember
  has_one :caregiver
  # belongs_to :usertypes, polymorphic:true, dependent: :destroy --> delete
  before_save {self.email = email.downcase}

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, length: {in: 8..72}, on: :create

  validates :contact, length: {is: 8},
  presence: true


  has_secure_password

  def self.find_and_authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
