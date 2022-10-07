class AddKeysToBags < ActiveRecord::Migration[6.1]
  def change
    add_reference :bags, :user, null: false, foreign_key: true
    add_reference :bags, :reservation, null: false, foreign_key: true
  end
end
