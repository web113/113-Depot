class RemoveCartIdFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :cart_id
  end

  def self.down
    add_column :users, :cart_id, :integer
  end
end
