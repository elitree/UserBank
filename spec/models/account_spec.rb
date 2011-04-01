require 'spec_helper'

describe Account do

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.accounts.create!(@attr)
  end

  describe "user associations" do
    
    before(:each) do
      @account = @user.accounts.create(@attr)
    end

    it "should have a user attribute" do
      @account.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @account.user_id.should == @user.id
      @account.user.should == @user
    end
  end
end
