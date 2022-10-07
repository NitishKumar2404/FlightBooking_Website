class ChangeBagsToBags < ActiveRecord::Migration[6.1]
  def change
    rename_table :bags, :bags
  end
end
