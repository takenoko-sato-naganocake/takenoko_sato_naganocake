class Shipping < ApplicationRecord
    belongs_to :customer
    validates :name, presence: true
    validates :post_cord, presence: true
    validates :address, presence: true
end
