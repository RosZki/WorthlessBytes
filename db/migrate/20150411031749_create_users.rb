class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :salt
      t.string :country
      t.text :aboutme
      t.text :profilepicture

      t.timestamps null: false
    end
  end
end
