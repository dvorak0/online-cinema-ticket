class Account < ActiveRecord::Base
  attr_accessible :balance, :email, :password,:password_confirmation, :score, :username
  has_secure_password
end
