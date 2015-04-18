class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.integer :game_id
      t.text :picture

      t.timestamps null: false
    end
  end
end
