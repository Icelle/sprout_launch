class Person < ActiveRecord::Base
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :gender, presence:true
  validates :birthday, presence:true

  belongs_to :user,
    inverse_of: :persons

  has_many :measurements
end
