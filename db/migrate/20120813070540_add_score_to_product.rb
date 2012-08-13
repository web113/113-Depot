class AddScoreToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :score, :float
  end

  def self.down
    remove_column :products, :score
  end
end
