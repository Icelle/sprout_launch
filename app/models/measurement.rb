class Measurement < ActiveRecord::Base
  belongs_to :person,
    inverse_of: :measurements

end
