# == Schema Information
# Schema version: 20110401004449
#
# Table name: transactions
#
#  id         :integer         not null, primary key
#  amount     :decimal(, )
#  comment    :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Transaction < ActiveRecord::Base
  belongs_to :account
  
  default_scope :order => 'transactions.created_at DESC'
end
