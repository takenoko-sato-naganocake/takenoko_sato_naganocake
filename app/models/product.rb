class Product < ApplicationRecord
  attachment :image

  has_many :cart_products, dependent: :destroy

  validates :image, presence: true
  validates :name, presence: true
  validates :caption, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

end
