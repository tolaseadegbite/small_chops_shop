class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.references :user, null: false, foreign_key: true, unique: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
