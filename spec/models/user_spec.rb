require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :firstname => "Example", :lastname => "User", :email => "user@example.com", :phone => "617-111-1111"}
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a first name"
end

