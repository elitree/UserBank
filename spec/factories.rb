# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.firstname             "Michael"
  user.lastname              "Hartl"
  user.email                 "mhartl@example.com"
  user.phone                 "617-111-1111"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :account do |account|
  account.amount "100.00"
  account.acct_type "savings"
  account.minimuminitdeposit "20.00"
  account.interestrate "0.05"
end