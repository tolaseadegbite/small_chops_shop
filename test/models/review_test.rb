# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  rating     :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reviews_on_product_id              (product_id)
#  index_reviews_on_user_id                 (user_id)
#  index_reviews_on_user_id_and_product_id  (user_id,product_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
    @product = products(:product1)
    @review = @user.reviews.build(title: 'Lekker review', body: 'Best review ever', rating: 5, product: @product)
  end

  test 'must be valid' do
    assert @review.valid?
  end

  test "body must be present" do
    @review.body = nil
    assert_not @review.valid?
  end

  test "title must be present" do
    @review.title = nil
    assert_not @review.valid?
  end

  test "rating must be present" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "must be greater than zero" do
    @review.rating = 0
    assert_not @review.valid?
  end
end
