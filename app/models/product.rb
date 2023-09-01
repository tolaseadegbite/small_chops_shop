# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  archive     :boolean          default(FALSE)
#  code        :string
#  description :text
#  feature     :boolean          default(FALSE)
#  name        :string
#  stock       :integer
#  unit_price  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_products_on_name     (name) UNIQUE
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
    before_create :product_code
    
    belongs_to :user

    validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Product name must be unique" }
    validates :stock, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :unit_price, presence: true, numericality: { greater_than: 0 }

    scope :ordered, -> { order(created_at: :desc) }

    def Product.new_token
        SecureRandom.urlsafe_base64(4)
    end
    
    def product_code
        self.code = Product.new_token
    end
end
