require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:firstname => "Example",
                 :lastname => "User",
                 :email => "example@railstutorial.org",
                 :phone => "123-456-7890",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    
    99.times do |n|
      firstname  = Faker::Name.first_name
      lastname = Faker::Name.last_name
      phone = Faker::PhoneNumber.phone_number
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:firstname => firstname,
                   :lastname => lastname,
                   :phone => phone,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
