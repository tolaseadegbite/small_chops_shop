require "test_helper"

class Admin::BannersControllerTest < ActionDispatch::IntegrationTest
    def setup
        @admin = users(:tolase)
        @non_admin = users(:jane)
        @banner = banners(:banner1)
    end

    test 'should redirect new when not logged in' do
        get new_admin_banner_path
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect create when not logged in' do
        assert_no_difference 'Banner.count' do
            post admin_banners_path, params: { banner: { label: 'Cool label' } }
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect create when logged in as non admin user' do
        sign_in @non_admin
        assert_no_difference 'Banner.count' do
            post admin_banners_path, params: { banner: { label: 'Cool label' } }
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect edit when not logged in' do
        get edit_admin_banner_path(@banner)
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect edit when logged in as non admin' do
        sign_in @non_admin
        get edit_admin_banner_path(@banner)
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect update when not logged in' do
        @banner.label = 'Cool label'
        patch admin_banner_path(@banner), params: { banner: { label: 'Nice label' } }
        assert_redirected_to root_url
        assert_not flash.empty?
        assert_equal @banner.label, 'Cool label'
    end

    test 'should redirect update when logged in as non admin' do
        sign_in @non_admin
        @banner.label = 'Cool label'
        patch admin_banner_path(@banner), params: { banner: { label: 'Nice label' } }
        assert_redirected_to root_url
        assert_not flash.empty?
        assert_equal @banner.label, 'Cool label'
    end

    test 'should redirect destroy when not logged in' do
        assert_no_difference 'Banner.count' do
            delete admin_banner_path(@banner)
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect destroy when logged in as non admin' do
        assert_no_difference 'Banner.count' do
            delete admin_banner_path(@banner)
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end
end
