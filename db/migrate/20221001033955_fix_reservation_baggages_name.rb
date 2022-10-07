class FixReservationBagsName < ActiveRecord::Migration[6.1]
  def change
    def self.up
      rename_column :reservations, :bags_num, :bags_num
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
  end
end
