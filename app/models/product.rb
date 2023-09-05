# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  archive        :boolean          default(FALSE)
#  average_rating :decimal(, )      default(0.0)
#  code           :string
#  description    :text
#  feature        :boolean          default(FALSE)
#  name           :string
#  reviews_count  :integer          default(0)
#  stock          :integer
#  unit_price     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_name         (name) UNIQUE
#  index_products_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
    before_create :product_code
    
    belongs_to :user
    belongs_to :category

    has_many :reviews, dependent: :destroy
    has_many :wishlists, dependent: :destroy
    has_many :wishlist_users, through: :wishlists, source: :user

    validates :user_id, :category_id, presence: true

    validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Product name must be unique" }
    validates :stock, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :unit_price, presence: true, numericality: { greater_than: 0 }

    scope :ordered, -> { order(created_at: :desc) }

    has_one_attached :image do |attachable|
        attachable.variant :display, resize_to_limit: [500, 500]
    end

    validates :image, presence: true,   content_type: { in: %w[image/jpeg image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 1.megabytes,
                                      message:   "should be less than 1MB" }

    def Product.new_token
        SecureRandom.urlsafe_base64(4)
    end
    
    def product_code
        self.code = Product.new_token
    end
end
