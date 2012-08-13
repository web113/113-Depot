class AddScoreToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :score, :float, :default => 0.0
  end

  def self.down
    remove_column :products, :score
  end
end
