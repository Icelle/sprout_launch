class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :gender, index: true
      t.date :birthday, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
