class AddFeatureAndArchiveAttributesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :feature, :boolean, default: false
    add_column :products, :archive, :boolean, default: false
  end
end
