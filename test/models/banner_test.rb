# == Schema Information
#
# Table name: banners
#
#  id         :bigint           not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_banners_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class BannerTest < ActiveSupport::TestCase
  def setup
    @user = users(:tolase)
    @banner = @user.banners.build(label: 'Banner 1')
  end

  test "must be valid" do
    @banner.valid?
  end

  test "label must be present" do
    @banner.label = nil
    assert_not @banner.valid?
  end
end
