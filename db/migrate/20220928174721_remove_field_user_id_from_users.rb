class RemoveFieldUserIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_id, :string
  end
end
