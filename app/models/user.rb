class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 8, maximum: 32 }
end
