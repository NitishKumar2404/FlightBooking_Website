class Bag < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  validates :user_id, presence: true
  validates :weight, presence: true
  # validates :bag_cost, presence: true
end
