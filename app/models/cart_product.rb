class CartProduct < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product
  
  def sum_of_price
    product.taxin_price * quantity
  end
  
  scope :products_of_price, -> { inject(0){ |sum, product| sum + product.sum_of_price } }
  
end
