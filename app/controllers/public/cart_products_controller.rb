class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.save
    redirect_to cart_products_path
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:quantity, :product_id, :customer_id)
    end
end
