class Reservation < ApplicationRecord
  belongs_to :flight
  belongs_to :user
  has_many :bags, dependent: :destroy
  validates :flight_id, presence: true
  validates :user_id, presence: true
  validates :passengers_num, presence: true


  def self.search(search_user_id)
    # raise(search_source, search_destination)
      if search_user_id.nil? || search_user_id.length==0
        Reservation.all
      else
        #self.joins(:users).where(users: {user_id: search_user_id})
        self.where(user_id:search_user_id)
      end
    end


end