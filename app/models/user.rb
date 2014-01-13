class User < ActiveRecord::Base
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true, email:true
  validates :password, presence:true

  has_many :people

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
