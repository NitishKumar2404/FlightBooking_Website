class RemoveFieldCostFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :cost, :string
  end
end
