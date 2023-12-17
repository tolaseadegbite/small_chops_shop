require "test_helper"

class WishlistCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tolase)
    @product = products(:product1)
    @wishlist = wishlists(:wishlist1)
    sign_in @user
  end

  test "should redirect create with invalid information" do
    get product_path(@product)
    assert_no_difference 'Wishlist.count' do
      post product_wishlists_path(@product, format: :turbo_stream), params: { wishlist: { product: nil } }
    end
    assert_not flash.empty?
  end

  # test "create wishlist with valid information" do
  #   get product_path(@product)
  #   assert_template 'products/show'
  #   assert_difference 'Wishlist.count', 1 do
  #     post product_wishlists_path(@product, format: :turbo_stream), params: { wishlist: { product: @product } }
  #   end
  #   assert_not flash.empty?
  # end

  test "destroy wishlist" do
    get product_path(@product)
    assert_template 'products/show'
    assert_difference 'Wishlist.count', -1 do
      delete product_wishlist_path(@product, @wishlist)
    end
    assert_not flash.empty?
  end
end
