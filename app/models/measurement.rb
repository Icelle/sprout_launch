class Measurement < ActiveRecord::Base
  validates :height, presence:true, :numericality => {:greater_than => 0}
  validates :weight, presence:true, :numericality => {:greater_than => 0}

  belongs_to :person,
    inverse_of: :measurements

end
