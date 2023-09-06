# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
    has_many :orderables, dependent: :destroy
    has_many :products, through: :orderables, dependent: :destroy

    def total
        orderables.to_a.sum { |orderable| orderable.total }
    end
end
