class ChangeSurnameNameToSurname < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :surname_name, :surname
  end
end
