class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :review_ratings, :gamereview_id, :game_review_id
  end
end
