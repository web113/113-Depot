class RemoveUserIdFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :user_id
  end

  def self.down
    add_column :orders, :user_id, :string
  end
end
