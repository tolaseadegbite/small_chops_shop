class AddReviewsCountAndAverageRatingToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :reviews_count, :integer, default: 0
    add_column :products, :average_rating, :integer, default: 0
  end
end
