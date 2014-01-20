class User < ActiveRecord::Base
  include Helper
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

  # @param [String] type- height and weight for a given person
  # @return [Array] collection of x,y coordinate for all people and national average (agemos)
  def fetch_children_graph(type)
    data = []
    people = self.people
    colors = gen_colors(people.size)

    people.each_with_index do |person, idx|
      data_points = person.fetch_agemos_data(type)

      if !data_points.empty?
          data.push({
            color: colors[idx],
            data: data_points,
            name: "#{person.first_name + " " + person.last_name}"
            })
      end
    end
    return data
  end
end
