class Measurement < ActiveRecord::Base
  validates_numericality_of :height, greater_than: 0, presence:true
  validates_numericality_of :weight, greater_than: 0, presence:true

  belongs_to :person,
    inverse_of: :measurements
end
