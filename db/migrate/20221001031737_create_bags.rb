class CreateBags < ActiveRecord::Migration[6.1]
  def change
    create_table :bags do |t|
      t.float :weight
      t.float :cost

      t.timestamps
    end
  end
end
