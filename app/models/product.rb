class Product < ApplicationRecord

  attachment :image

  belongs_to :genre
  has_many :cart_products, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :image, presence: true
  validates :name, presence: true
  validates :caption, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  
  def taxin_price
    price * 1.1
  end

end
