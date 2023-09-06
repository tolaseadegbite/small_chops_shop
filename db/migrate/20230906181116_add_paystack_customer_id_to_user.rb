class AddPaystackCustomerIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :paystack_customer_id, :string, unique: true
  end
end
