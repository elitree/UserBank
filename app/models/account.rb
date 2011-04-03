# == Schema Information
# Schema version: 20110401004449
#
# Table name: accounts
#
#  id           :integer         not null, primary key
#  amount       :decimal(, )
#  interestrate :decimal(, )
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  acct_type    :string(255)
#

class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :acct_type, :interestrate, :user_id
  
  validates :amount, :presence => true,
                     :numericality => { :greater_than => 0 }

  default_scope :order => 'accounts.id ASC'
  
  def deposit (amount) 
    self.update_attributes(:amount => self.amount + amount)
  end
  
  def withdraw (amount) 
    self.update_attributes(:amount => self.amount - amount)
  end  
  
end
