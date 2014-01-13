class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :measurement_type
      t.decimal :value
      t.date :as_of_dt
      t.references :person, index: true, unique:true

      t.timestamps
    end
  end
end
