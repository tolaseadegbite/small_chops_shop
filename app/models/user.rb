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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
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

  enum :role, { 
    'Normal': 0,
    'Super Admin': 1,
    'Admin': 2
   }
end
