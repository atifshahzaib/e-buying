class User < ApplicationRecord
  has_many :orders
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , :uniqueness => { :case_sensitive => false }
  before_save { self.email = email.downcase }
  has_secure_password
end
