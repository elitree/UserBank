class RenameUseridToUserId < ActiveRecord::Migration
  def self.up
     rename_column :accounts, :userid, :user_id
     add_column :accounts, :acct_type, :string
     add_index :accounts, :user_id
  end

  def self.down
     rename_column :accounts, :user_id, :userid
     remove_column :accounts, :acct_type
     remove_index :accounts, :user_id
  end
end
