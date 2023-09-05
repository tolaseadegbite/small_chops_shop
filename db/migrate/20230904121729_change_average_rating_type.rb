class ChangeAverageRatingType < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :average_rating, :decimal
  end
end
