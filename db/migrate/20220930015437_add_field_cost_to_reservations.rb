class AddFieldCostToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :cost, :float
  end
end
