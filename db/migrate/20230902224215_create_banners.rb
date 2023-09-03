class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :label
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
