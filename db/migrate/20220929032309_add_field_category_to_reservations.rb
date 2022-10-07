class AddFieldCategoryToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :category, :string
  end
end
