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
class Category < ApplicationRecord
  # validates the presence of name
  validates_presence_of :name

  # associations
  belongs_to :user
  belongs_to :banner
  has_many :products, dependent: :destroy

  # order categories by id in descending order
  scope :ordered, -> { order(id: :desc) }

end
