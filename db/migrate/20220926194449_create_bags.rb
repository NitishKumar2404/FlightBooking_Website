class CreateBags < ActiveRecord::Migration[6.1]
  def change
    create_table :bags do |t|
      t.string :bag_id
      t.float :weight
      t.float :cost

      t.timestamps
    end
    add_index :bags, :bag_id, unique: true
  end
end
