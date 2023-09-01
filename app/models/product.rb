# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  code        :string
#  description :text
#  name        :string
#  stock       :integer
#  unit_price  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Product name must be unique" }
    validates_presence_of :unit_price, :stock

    scope :ordered, -> { order(created_at: :desc) }
end
