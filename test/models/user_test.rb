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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # def setup
  #   @user = User.create(first_name: 'John', surname: 'Doe', username: "lashe", email: 'john@eample.com', address_line_1: 'My address', phone_number: '08100001111', password: 123456, password_confirmation: 123456)
  # end

  # test 'user must be valid' do
  #   assert @user.valid?
  # end

  # test 'username must be present' do
  #   @user.username = nil
  #   assert_not @user.valid?
  # end

  # test 'username must be unique' do
  #   @second_user = @user.dup
  #   @second_user.username = 'john'
  #   @user.username = 'john'
  #   @user.save
  #   assert_not @second_user.valid?
  # end

  # test 'surname must be present' do
  #   @user.surname = nil
  #   assert_not @user.valid?
  # end

  # test 'first_name must be present' do
  #   @user.first_name = nil
  #   assert_not @user.valid?
  # end

  # test 'address_line_1 must be present' do
  #   @user.address_line_1 = nil
  #   assert_not @user.valid?
  # end
end
