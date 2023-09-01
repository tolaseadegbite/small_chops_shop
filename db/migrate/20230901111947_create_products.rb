class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, unique: true
      t.text :description
      t.integer :unit_price
      t.integer :stock
      t.string :code, unique: true

      t.timestamps
    end
  end
end
