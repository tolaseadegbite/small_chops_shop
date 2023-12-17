require "test_helper"

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Grills by Lashe'
    @user = users(:tolase)
    @product = products(:product1)
    @wishlist = wishlists(:wishlist2)
  end

  test "should redirect index when not logged in" do
    get my_wishlists_path
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect create when now logged in" do
    get product_path(@product)
    assert_template 'products/show'
    assert_no_difference 'Wishlist.count' do
      post product_wishlists_path(@product), params: { wishlist: { product: @product } }
    end
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect destroy when not logged in" do
    get product_path(@product)
    assert_template 'products/show'
    assert_no_difference 'Wishlist.count' do
      delete product_wishlist_path(@product, @wishlist), params: { wishlist: { product: @product } }
    end
    assert_redirected_to new_user_session_url
    assert_not flash.empty?
  end

  test "should redirect when logged in as wrong user" do
    sign_in @user
    assert_no_difference 'Wishlist.count' do
      delete product_wishlist_path(@product, @wishlist)
    end
    assert_redirected_to @product
    assert_not flash.empty?
  end
end
