class RemoveFieldClassFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :class, :string
  end
end
