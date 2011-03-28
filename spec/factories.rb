# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.firstname             "Michael"
  user.lastname              "Hartl"
  user.email                 "mhartl@example.com"
  user.phone                 "617-111-1111"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
