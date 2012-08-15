class AddCateToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :cate, :string
  end

  def self.down
    remove_column :products, :cate
  end
end
