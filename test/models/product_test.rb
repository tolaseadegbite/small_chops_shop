# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  archive     :boolean          default(FALSE)
#  code        :string
#  description :text
#  feature     :boolean          default(FALSE)
#  name        :string
#  stock       :integer
#  unit_price  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_name         (name) UNIQUE
#  index_products_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
