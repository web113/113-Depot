class RemoveUserIdFromCart < ActiveRecord::Migration
  def self.up
    remove_column :carts, :user_id
  end

  def self.down
    add_column :carts, :user_id, :string
  end
end
