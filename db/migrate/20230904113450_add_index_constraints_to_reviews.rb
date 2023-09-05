class AddIndexConstraintsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_index :reviews, [:user_id, :product_id], unique: true
  end
end
