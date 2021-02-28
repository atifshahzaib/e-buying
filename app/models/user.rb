class User < ApplicationRecord
  has_many :orders
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } , :uniqueness => { :case_sensitive => false }
end
