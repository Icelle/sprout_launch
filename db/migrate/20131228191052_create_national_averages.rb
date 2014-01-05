class CreateNationalAverages < ActiveRecord::Migration
  def change
    create_table :national_averages do |t|
      t.string :gender, index:true
      t.decimal :agemos
      t.decimal :l
      t.decimal :m
      t.decimal :s
      t.decimal :p50
      t.string  :stat_type

      t.timestamps
    end
  end
end
