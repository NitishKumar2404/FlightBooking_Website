class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :admin_id
      t.string :username

      t.timestamps
    end
    add_index :admins, :admin_id, unique: true
  end
end
