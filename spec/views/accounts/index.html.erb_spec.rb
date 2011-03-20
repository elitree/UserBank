require 'spec_helper'

describe "accounts/index.html.erb" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :amount => "9.99",
        :minimuminitdeposit => "9.99",
        :interestrate => "9.99",
        :userid => 1
      ),
      stub_model(Account,
        :amount => "9.99",
        :minimuminitdeposit => "9.99",
        :interestrate => "9.99",
        :userid => 1
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
