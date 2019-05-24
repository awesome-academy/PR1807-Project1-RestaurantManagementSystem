class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  before_save :downcase_email

  validates :name,  presence: true, length: {maximum: 50},
            format: {with: /[a-zA-Z\s]{1,50}/}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /[+]{0,1}([0-9]{2,4})?[-. ]?([0-9]{3})[-. ]?([0-9]{4})/
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :address, presence: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  private
  def downcase_email
    self.email = email.downcase
  end
end
