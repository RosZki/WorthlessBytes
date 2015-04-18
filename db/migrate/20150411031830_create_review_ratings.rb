class CreateReviewRatings < ActiveRecord::Migration
  def change
    create_table :review_ratings do |t|
      t.integer :user_id
      t.integer :gamereview_id
      t.boolean :rating

      t.timestamps null: false
    end
  end
end
