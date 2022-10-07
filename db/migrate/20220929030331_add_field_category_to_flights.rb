class AddFieldCategoryToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :category, :string
  end
end
