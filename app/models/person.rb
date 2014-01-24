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
      return self.measurements.where("measurement_type = ?", type).map{|measurement| measurement.get_xy}
    end
  end

  def fetch_agemos_data(type)
    self.measurements.where(:measurement_type => type).order('as_of_dt asc').map {|measurement| {"x" => measurement.age_mos.round(1) , "y" => measurement.value.to_f}}
  end

  # @param [String] type- height and weight for a given person
  # return [Array] collection of x,y coordinate for person and national average (date)
  def fetch_graph_with_national_avg(type)
    measurements = self.measurements.where("measurement_type = ?", type).order('as_of_dt asc')
    if measurements.empty?
      return nil
    else
      data = []
      year_after = self.birthday + 365
      max_date = measurements.last.as_of_dt
      #condition ? if_true : if_false
      end_date = year_after > max_date ? year_after : max_date
      #TODO: refactor to use common method for agemos (see measurement model)
      converted_end_date = ((end_date - self.birthday)/30.41).ceil
      national_avg_p50 = NationalAverage.where(:agemos => 0 .. converted_end_date, :gender => self.gender, :stat_type => type).order('agemos asc')
      p50_data = national_avg_p50.map { |national_avg| {"x" => (self.birthday + (national_avg.agemos*30.41)).strftime('%s').to_i , "y" =>national_avg.p50.to_f }}

      data.push({
        color: "hsl(190, 50%, 50%)",
        data: p50_data,
        name: "National Average"
        })

      measurements_xy = measurements.map {|measurement| measurement.get_xy}

      data.push({
        color: '#669933',
        data: measurements_xy,
        name: "#{self.first_name + " " + self.last_name}"
        })
      return data
    end
  end
end
