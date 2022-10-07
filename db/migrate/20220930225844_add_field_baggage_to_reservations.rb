class AddFieldBagToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :bag, :numeric
  end
end
