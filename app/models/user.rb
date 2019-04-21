class User < ApplicationRecord
  has_many :items
  has_many :events
  has_secure_password
  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates_format_of :email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
