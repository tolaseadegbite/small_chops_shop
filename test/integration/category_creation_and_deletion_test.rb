# require "test_helper"

# class CategoryCreationAndDeletionTest < ActionDispatch::IntegrationTest
#   def setup
#     @admin = users(:tolase)
#     @banner = banners(:banner1)
#     @category = categories(:cat1)
#     sign_in @admin
#   end

#   test 'do not create category with invalid information' do
#     assert_no_difference 'Category.count' do
#       post admin_categories_path, params: { category: { name: nil }  }
#     end
#     assert_template 'categories/new', status: :unprocessable_entity
#     assert_select 'div.text-danger'
#   end

#   test 'create category with valid information' do
#     get new_admin_category_path
#     assert_template 'categories/new'
#     assert_difference 'Category.count', 1 do
#       post admin_categories_path, params: { category: { name: 'Cool name' }  }
#     end
#     follow_redirect!
#     assert_template 'admin/categories/show'
#     assert_not flash.empty?
#   end

#   test 'delete category' do
#     assert_difference 'Category.count', -1 do
#       delete admin_category_path(@category)
#     end
#   end
# end
