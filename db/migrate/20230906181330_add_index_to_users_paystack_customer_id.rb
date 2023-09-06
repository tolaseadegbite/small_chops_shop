class AddIndexToUsersPaystackCustomerId < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :paystack_customer_id, unique: true
  end
end
