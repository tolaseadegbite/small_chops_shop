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
        @category = categories(:cat1)
        @product = @user.products.build(name: 'John', description: 'A description', category: @category, unit_price: 10000, stock: 10, reviews_count: 1, sales_count: 1, archive: false, feature: false, average_rating: 3.5)
    end

    test "should be valid" do
        assert @product.valid?
    end

    test "user must be present" do
        @product.user = nil
        @product.save
        assert_not @product.valid?
    end

    test "name must be unique" do
        @second_product = @product.dup
        @second_product.name = "Product 1"
        @product.name = "Product 1"
        @product.save
        assert_not @second_product.valid?
    end

    test "stock must be present" do
        @product.stock = nil
        assert_not @product.valid?
    end

    test "stock must be of integer type" do
        @product.stock = 3.6
        assert_not @product.valid?
    end

    test "must be greater than zero" do
        @product.stock = 0
        assert_not @product.valid?
    end

    test "unit price must be present" do
        @product.unit_price = nil
        assert_not @product.valid?
    end
end
