class RemoveFieldBagFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :bag, :numeric
  end
end
