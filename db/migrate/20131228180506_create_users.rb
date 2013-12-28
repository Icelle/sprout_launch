class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :user_name, index: true
      t.string :email, index: true, unique:true
      t.string :password, index: true

      t.timestamps
    end
  end
end
