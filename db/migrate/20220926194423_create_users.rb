class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_id
      t.string :card
      t.string :address
      t.string :mobile
      t.string :email

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
