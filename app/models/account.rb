# == Schema Information
# Schema version: 20110320014308
#
# Table name: accounts
#
#  id                 :integer         not null, primary key
#  amount             :decimal(, )
#  minimuminitdeposit :decimal(, )
#  interestrate       :decimal(, )
#  userid             :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount
end
