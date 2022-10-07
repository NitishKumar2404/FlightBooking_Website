class Flight < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :category, presence: true
  validates :manufacturer, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :capacity, presence: true
  validates :status, presence: true
  validates :cost, presence: true

  validate :source_diff_location

  # def self.search(search)
  #   if search.length>=1
  #     self.where(source: search)
  #   els
  #     Flight.all
  #   end
  # end

  def self.search(search_source, search_destination)
    # raise(search_source, search_destination)
    if search_source.nil? && search_destination.nil?
      Flight.all

    elsif search_source.nil? || search_source.length==0
      # Flight.all
      if search_destination.length>=1
        self.where(destination: search_destination)
      else
        Flight.all
      end

    elsif search_destination.nil? || search_destination.length==0
      # Flight.all
      if search_source.length>=1
        self.where(source: search_source)
      else
        Flight.all
      end

    elsif search_source.length>=1 && search_destination.length>=1
      self.where(source: search_source, destination: search_destination)

    else
      Flight.all
    end
  end
  private
    def source_diff_location
      if source == destination
        errors.add(:destination, 'source and destination cannot be the same')
      end
    end


end
