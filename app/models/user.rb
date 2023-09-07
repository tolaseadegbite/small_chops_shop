# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address_line_1         :string
#  address_line_2         :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  phone_number           :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviews_count          :integer          default(0)
#  role                   :integer          default("Normal"), not null
#  surname                :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  paystack_customer_id   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_paystack_customer_id  (paystack_customer_id) UNIQUE
#  index_users_on_phone_number          (phone_number)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false, message: "Username must be unique" }
  validates_presence_of :first_name, :surname, :address_line_1

  has_many :products, dependent: :destroy
  has_many :banners, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_products, through: :wishlists, source: :product

  has_one_attached :avatar do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end

  validates :avatar, presence: true,   content_type: { in: %w[image/jpeg image/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 1.megabytes,
                                    message:   "should be less than 1MB" }

  enum :role, { 
    'Normal': 0,
    'Super Admin': 1,
    'Admin': 2
   }

   after_create do
    return if paystack_customer_id.present?

    paystack_customers = PaystackCustomers.new(PAYSTACKOBJ)

    customer = paystack_customers.create(
                                        email: email ,
                                        first_name: first_name,
                                        last_name: surname,
                                        phone: phone_number
                                       )

    update(paystack_customer_id: customer['data']['customer_code'])
  end
end
