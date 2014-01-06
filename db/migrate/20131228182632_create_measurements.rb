class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.decimal :height
      t.decimal :weight
      t.integer :user_id, index: true, unique:true
      t.references :person, index: true, unique:true

      t.timestamps
    end
  end
end
