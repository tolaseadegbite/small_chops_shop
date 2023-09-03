class Category < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  belongs_to :banner
  scope :ordered, -> { order(created_at: :desc) }
end
