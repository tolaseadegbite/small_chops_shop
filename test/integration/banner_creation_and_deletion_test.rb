require "test_helper"

class BannerCreationAndDeletionTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:tolase)
    @banner = banners(:banner1)
    sign_in @admin
  end

  test 'do not create project with invalid information' do
    assert_no_difference 'Banner.count' do
      post admin_banners_path, params: { banner: { label: nil }  }
    end
    assert_template 'banners/new', status: :unprocessable_entity
    assert_select 'div.text-danger'
  end

  test 'create project with valid information' do
    get new_admin_banner_path
    assert_template 'banners/new'
    assert_difference 'Banner.count', 1 do
      post admin_banners_path, params: { banner: { label: 'Cool label' }  }
    end
    follow_redirect!
    assert_template 'admin/banners/show'
    assert_not flash.empty?
  end

  # test 'delete banner' do
  #   assert_difference 'Banner.count', -1 do
  #     delete admin_banner_path(@banner)
  #   end
  # end
end
