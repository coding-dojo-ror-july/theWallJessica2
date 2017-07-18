class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :comments
  validates :username, uniqueness: true
  validates :username, length: { minimum: 5}
end
