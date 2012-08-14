class RemoveShipFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :ship
  end

  def self.down
    add_column :orders, :ship, :boolean
  end
end
