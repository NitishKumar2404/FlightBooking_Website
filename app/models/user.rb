class User < ApplicationRecord
  has_secure_password
  # has_many :bags
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :card, format: { with: /[0-9][0-9][0-9][0-9](-)[0-9][0-9][0-9][0-9](-)[0-9][0-9][0-9][0-9](-)[0-9][0-9][0-9][0-9]/, message: "allows only xxxx-xxxx-xxxx-xxxx" }
end
