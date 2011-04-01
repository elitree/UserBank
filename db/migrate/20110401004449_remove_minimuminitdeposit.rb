class RemoveMinimuminitdeposit < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :minimuminitdeposit
  end

  def self.down
    add_column :accounts, :minimuminitdeposit, :decimal
  end
end
