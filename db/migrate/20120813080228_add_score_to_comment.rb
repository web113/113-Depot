class AddScoreToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :score, :float, :default => 0.00
  end

  def self.down
    remove_column :comments, :score
  end
end
