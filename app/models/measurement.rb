class Measurement < ActiveRecord::Base
  MEASUREMENT_TYPES = %w[height weight]

  validates :measurement_type, inclusion: {in:MEASUREMENT_TYPES}, presence:true
  validates_numericality_of :value, greater_than: 0, presence:true

  belongs_to :person,
    inverse_of: :measurements

  def age_mos
    ((self.as_of_dt - self.person.birthday)/30.41).to_f
  end

  def get_national_avg
    match_1 = NationalAverage.where("agemos <= ? and gender = ? and stat_type = ?", self.age_mos, self.person.gender, self.measurement_type).order('agemos desc').first
    match_2 = NationalAverage.where("agemos >= ? and gender = ? and stat_type = ?", self.age_mos, self.person.gender, self.measurement_type).order('agemos asc').first
    if (self.age_mos - match_1.agemos).abs > (self.age_mos - match_2.agemos)
      return match_2
    else
      return match_1
    end
  end

  def percentile
    natl_avg = self.get_national_avg
    return natl_avg.percentile(self.value)
  end
end


# date | weight/height | percentile
