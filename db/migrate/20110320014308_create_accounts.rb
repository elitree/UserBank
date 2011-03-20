class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.decimal :amount
      t.decimal :minimuminitdeposit
      t.decimal :interestrate
      t.integer :userid

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
