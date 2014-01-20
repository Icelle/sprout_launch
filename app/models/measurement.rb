class Measurement < ActiveRecord::Base
  MEASUREMENT_TYPES = %w[height weight]

  validates :measurement_type, inclusion: {in:MEASUREMENT_TYPES}, presence:true
  validates_numericality_of :value, greater_than: 0, presence:true

  belongs_to :person,
    inverse_of: :measurements

  #calculate age based on as_of_dt and convert to months
  #approx 30.41 days in a month
  def age_mos
    ((self.as_of_dt - self.person.birthday)/30.41).to_f
  end

  #try to match age_mos to agemos in the database to find what percentile person/baby belongs to.
  def get_national_avg
    match_1 = NationalAverage.where("agemos <= ? and gender = ? and stat_type = ?", self.age_mos, self.person.gender, self.measurement_type).order('agemos desc').first
    match_2 = NationalAverage.where("agemos >= ? and gender = ? and stat_type = ?", self.age_mos, self.person.gender, self.measurement_type).order('agemos asc').first
    if (self.age_mos - match_1.agemos).abs > (self.age_mos - match_2.agemos)
      return match_2
    else
      return match_1
    end
  end

  #get percentile from the national avg search
  def percentile
    natl_avg = self.get_national_avg
    return natl_avg.percentile(self.value)
  end

  def get_xy
    return {"x"=> self.as_of_dt.strftime('%s').to_i, "y" => self.value.to_f}
  end
end
