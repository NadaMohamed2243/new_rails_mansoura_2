class User < ApplicationRecord
   # b.1 Presence validation
  validates :name, :dob, :email, :phone_number, presence: true
  
  # b.2 Email format validation
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  # b.3 Uniqueness validation
  validates :email, uniqueness: { case_sensitive: false }                  
end