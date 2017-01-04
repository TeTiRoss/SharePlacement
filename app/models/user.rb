class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true

  has_secure_password

  has_many :reviews
end
