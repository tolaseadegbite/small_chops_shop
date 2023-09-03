class Banner < ApplicationRecord
  belongs_to :user

  has_one :category

  validates_presence_of :label

  scope :ordered, -> { order(created_at: :desc) }

  has_one_attached :image do |attachable|
      attachable.variant :display, resize_to_limit: [500, 500]
  end

  validates :image, presence: true,   content_type: { in: %w[image/jpeg image/png],
                                  message: "must be a valid image format" },
                    size:         { less_than: 1.megabytes,
                                  message:   "should be less than 1MB" }
end
