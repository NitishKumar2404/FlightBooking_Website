class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :flight_id
      t.string :class
      t.string :manufacturer
      t.string :source
      t.string :destination
      t.numeric :capacity
      t.string :status
      t.float :cost

      t.timestamps
    end
    add_index :flights, :flight_id, unique: true
  end
end
