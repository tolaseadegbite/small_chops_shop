# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  banner_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_categories_on_banner_id  (banner_id)
#  index_categories_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (banner_id => banners.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @banner = banners(:banner1)
    @category = @user.categories.build(name: 'fries', banner: @banner)
  end

  test "must be valid" do
    @category.valid?
  end

  test "name must be present" do
    @category.name = nil
    assert_not @category.valid?
  end
end
