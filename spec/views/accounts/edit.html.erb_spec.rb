require 'spec_helper'

describe "accounts/edit.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :amount => "9.99",
      :minimuminitdeposit => "9.99",
      :interestrate => "9.99",
      :userid => 1
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accounts_path(@account), :method => "post" do
      assert_select "input#account_amount", :name => "account[amount]"
      assert_select "input#account_minimuminitdeposit", :name => "account[minimuminitdeposit]"
      assert_select "input#account_interestrate", :name => "account[interestrate]"
      assert_select "input#account_userid", :name => "account[userid]"
    end
  end
end
