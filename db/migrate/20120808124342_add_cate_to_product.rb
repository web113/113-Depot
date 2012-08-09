class AddCateToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :cate, :string, :default => 'IT'
  end

  def self.down
    remove_column :products, :cate
  end
end
