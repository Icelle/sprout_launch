class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender, index: true
      t.date :birthday
      t.references :user, index: true

      t.timestamps
    end
  end
end
