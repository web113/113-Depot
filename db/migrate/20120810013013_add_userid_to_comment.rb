class AddUseridToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :userid, :string
  end

  def self.down
    remove_column :comments, :userid
  end
end
