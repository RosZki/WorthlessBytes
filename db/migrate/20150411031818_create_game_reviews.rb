class CreateGameReviews < ActiveRecord::Migration
  def change
    create_table :game_reviews do |t|
      t.integer :game_id
      t.integer :user_id
      t.text :summary
      t.text :review
      t.boolean :rating

      t.timestamps null: false
    end
  end
end
