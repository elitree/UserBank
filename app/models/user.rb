# == Schema Information
# Schema version: 20110320014308
#
# Table name: users
#
#  id         :integer         not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  phone      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :accounts
  attr_accessible :firstname, :lastname, :phone, :email

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
end

