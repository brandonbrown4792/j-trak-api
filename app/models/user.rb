class User < ApplicationRecord
  has_many :contacts
  has_many :jobs
  
  has_secure_password
end
