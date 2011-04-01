class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.decimal :amount
      t.string :comment
      t.integer :account_id

      t.timestamps
    end
    add_index :transactions, :account_id
  end

  def self.down
    drop_table :transactions
    remove_index :transactions, :account_id
  end
end
