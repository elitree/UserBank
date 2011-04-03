require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
  
    # Reset the database
    Rake::Task['db:reset'].invoke
    
    # Make an Admin user
    admin = User.create!(:firstname => "Admin",
                 :lastname => "User",
                 :email => "admin@site.org",
                 :phone => "123-456-7890",
                 :password => "123456",
                 :password_confirmation => "123456")
    admin.toggle!(:admin)
    
    # Make a normal user
    User.create!(:firstname => "Normal",
                 :lastname => "User",
                 :email => "user@site.org",
                 :phone => "123-456-7891",
                 :password => "567890",
                 :password_confirmation => "567890")
                 
    18.times do |n|
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
    
    User.all.each do |user|
      3.times do
        if (rand(999)%2 == 0) 
          acct_type = "Savings"
          interestrate = 0.05
        else
          acct_type = "Checking"
          interestrate = 0.02
        end
        user.accounts.create!(:amount => rand(999).to_s+"."+rand(99).to_s,
                              :acct_type => acct_type, 
                              :interestrate => interestrate)
      end
    end
    
  end
end
