# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  archive        :boolean          default(FALSE)
#  average_rating :decimal(, )      default(0.0)
#  code           :string
#  description    :text
#  feature        :boolean          default(FALSE)
#  name           :string
#  reviews_count  :integer          default(0)
#  sales_count    :integer          default(0)
#  stock          :integer
#  unit_price     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint           not null
#  user_id        :bigint           not null
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
  def setup
    @user = users(:tolase)
    category = categories(:cat1)
    @product = @user.products.build(name: "Barbeque", description: "Quality stuff", stock: 10, unit_price: 100, category_id: category, average_rating: 3.5, archive: false, feature: true, sales_count: 2, reviews_count: 2, code: "nvbskhvs")
  end

  test "product is valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = "  "
    assert_not @product.valid?
  end

  test "description should be present" do
    @product.description = "  "
    assert_not @product.valid?
  end
end
