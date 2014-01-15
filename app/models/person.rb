class Person < ActiveRecord::Base
  GENDERS = %w[male female]

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :gender, :inclusion => { :in => GENDERS }
  validates :birthday, presence:true
  validates :birthday, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}

  belongs_to :user,
    inverse_of: :people

  has_many :measurements

  # @param [String] type - type of measurement type to be returned for a given person
  # @return [Array] collection of x,y coordinates for graphing. Converts times to seconds since unix epoch
  def fetch_graph_data(type)
    if !Measurement::MEASUREMENT_TYPES.include?(type)
      raise "Invalid type #{type} specified. Must be one of: #{Measurement::MEASUREMENT_TYPES.to_s}"
    else
      # populate data by measurement type into {x: val, y: val}..[{x:898989, y:89}, {x:78787,y:90}, {x:78787,y:90}]
      return self.measurements.where("measurement_type = ?", type).map{|measurement|{"x"=> measurement.as_of_dt.strftime('%s').to_i, "y" => measurement.value.to_f}}
    end
  end
end
