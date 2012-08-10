class AddCartIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :cart_id, :integer
  end

  def self.down
    remove_column :users, :cart_id
  end
end
