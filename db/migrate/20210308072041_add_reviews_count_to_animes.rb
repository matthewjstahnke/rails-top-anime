class AddReviewsCountToAnimes < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :reviews_count, :integer
  end
end
