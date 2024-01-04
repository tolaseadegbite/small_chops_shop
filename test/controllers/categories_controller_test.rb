require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @admin = users(:tolase)
        @non_admin = users(:jane)
        @category = categories(:cat1)
        @banner = banners(:banner1)
    end

    test 'should redirect new when not logged in' do
        get new_admin_category_path
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect create when not logged in' do
        assert_no_difference 'Category.count' do
            post admin_categories_path, params: { category: { name: 'Cool category'  } }
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect create when logged in as non admin user' do
        sign_in @non_admin
        assert_no_difference 'Category.count' do
            post admin_categories_path, params: { category: { name: 'Cool category'  } }
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect edit when not logged in' do
        get edit_admin_category_path(@category)
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect edit when logged in as non admin' do
        sign_in @non_admin
        get edit_admin_category_path(@category)
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect update when not logged in' do
        @category.name = 'Cool name'
        patch admin_category_path(@category), params: { category: { name: 'Cool category'  } }
        assert_redirected_to root_url
        assert_not flash.empty?
        assert_equal @category.name, 'Cool name'
    end

    test 'should redirect update when logged in as non admin' do
        sign_in @non_admin
        @category.name = 'Cool name'
        patch admin_category_path(@category), params: { category: { name: 'Cool category'  } }
        assert_redirected_to root_url
        assert_not flash.empty?
        assert_equal @category.name, 'Cool name'
    end

    test 'should redirect destroy when not logged in' do
        assert_no_difference 'Category.count' do
            delete admin_category_path(@category)
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end

    test 'should redirect destroy when logged in as non admin' do
        assert_no_difference 'Category.count' do
            delete admin_category_path(@category)
        end
        assert_redirected_to root_url
        assert_not flash.empty?
    end
end
