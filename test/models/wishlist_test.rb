# == Schema Information
#
# Table name: wishlists
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_wishlists_on_product_id              (product_id)
#  index_wishlists_on_user_id                 (user_id)
#  index_wishlists_on_user_id_and_product_id  (user_id,product_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class WishlistTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @product = products(:product1)
    @wishlist = @user.wishlists.build(product: @product)
  end

  test "wishlist must be valid" do
    @wishlist.valid?
  end

  test "user must be present" do
    @wishlist.user = nil
    assert_not @wishlist.valid?
  end
end
