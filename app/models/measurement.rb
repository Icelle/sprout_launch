class Measurement < ActiveRecord::Base
  MEASUREMENT_TYPES = %w[height weight]

  validates :measurement_type, inclusion: {in:MEASUREMENT_TYPES}, presence:true
  validates_numericality_of :value, greater_than: 0, presence:true

  belongs_to :person,
    inverse_of: :measurements

  #def nationalaverage
end
