class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.numeric :passengers_num
      t.string :confirmation_num
      t.string :class
      t.string :amenities
      t.float :cost

      t.timestamps
    end
    add_index :reservations, :confirmation_num, unique: true
  end
end
