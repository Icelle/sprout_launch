class User < ActiveRecord::Base
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :user_name, presence:true
  validates :email_add, presence:true, email:true
  validates :password, presence:true

  has_many :persons
end
