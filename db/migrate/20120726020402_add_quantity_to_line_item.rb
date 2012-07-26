class AddQuantityToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :quantity, :integer, :default => 1 #设定quantity的默认值为1
  end

  def self.down
    remove_column :line_items, :quantity
  end
end
