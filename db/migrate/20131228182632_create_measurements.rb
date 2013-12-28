class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.decimal :height, index: true
      t.decimal :weight, index: true
      t.integer :user_id, index: true, unique:true
      t.references :person, index: true, unique:true

      t.timestamps
    end
  end
end
