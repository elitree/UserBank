# == Schema Information
# Schema version: 20110331030124
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  firstname          :string(255)
#  lastname           :string(255)
#  phone              :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean
#

require 'digest'
class User < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  attr_accessor :password
  attr_accessible :firstname, :lastname, :phone, :email, :password, :password_confirmation

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true
  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
                       
  before_save :encrypt_password

  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    return nil  if user.nil?
    return user if user.salt == cookie_salt
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end

