class RemoveScoreToProduct < ActiveRecord::Migration
  def self.up
    remove_column :products, :score
  end

  def self.down
    add_column :products, :score, :float
  end
end
