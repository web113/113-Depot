class AddShippedToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :shipped, :integer, :default => 0
  end

  def self.down
    remove_column :orders, :shipped
  end
end
