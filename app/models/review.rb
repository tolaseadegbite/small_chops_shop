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
class Review < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :product, counter_cache: true

  validates_presence_of :title, :body
  validates_presence_of :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true}
  validates :user_id, uniqueness: { scope: [:product_id], message: "You have already reviewed this product." }

  after_commit :update_average_rating, on: [:create, :update, :destroy]

  def update_average_rating
    product.update!(average_rating: product.reviews.average(:rating))
  end
end
