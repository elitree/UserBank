require 'spec_helper'

describe "accounts/new.html.erb" do
  before(:each) do
    assign(:account, stub_model(Account,
      :amount => "9.99",
      :minimuminitdeposit => "9.99",
      :interestrate => "9.99",
      :userid => 1
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accounts_path, :method => "post" do
      assert_select "input#account_amount", :name => "account[amount]"
      assert_select "input#account_minimuminitdeposit", :name => "account[minimuminitdeposit]"
      assert_select "input#account_interestrate", :name => "account[interestrate]"
      assert_select "input#account_userid", :name => "account[userid]"
    end
  end
end
