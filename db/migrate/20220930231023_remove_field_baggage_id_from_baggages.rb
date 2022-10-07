class RemoveFieldBagIdFromBags < ActiveRecord::Migration[6.1]
  def change
    remove_column :bags, :bag_id, :string
  end
end
