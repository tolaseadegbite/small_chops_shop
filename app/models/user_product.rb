# == Schema Information
#
# Table name: user_products
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#  transaction_id :string
#  user_id        :bigint           not null
#
# Indexes
#
#  index_user_products_on_product_id  (product_id)
#  index_user_products_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class UserProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
