class AddFieldBagsNumToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :bags_num, :numeric
  end
end
