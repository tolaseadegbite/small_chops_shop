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
  # update update_average_rating column when review is creates, updated and destroyed
  after_commit :update_average_rating, on: [:create, :update, :destroy]

  # associations
  belongs_to :user, counter_cache: true
  belongs_to :product, counter_cache: true

  # validates the presence of title and body attributes
  validates_presence_of :title, :body

  # validate the presence and numericality of rating. must be greater than 0 and less than 6
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  # validates presence and uniqueness of user on each review
  validates :user_id, uniqueness: { scope: [:product_id], message: "You have already reviewed this product." }
  
  # after commit callback
  def update_average_rating
    product.update!(average_rating: product.reviews.average(:rating))
  end
end
