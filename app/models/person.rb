class Person < ActiveRecord::Base
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :gender, :inclusion => { :in => ['male', 'female'] }
  validates :birthday, presence:true
  validates :birthday, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}

  belongs_to :user,
    inverse_of: :persons

  has_many :measurements
end
