class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all #カート内の全て
    @customer_cart_products = CartProduct.where(customer_id: current_customer.id) #自分がいれたカート内商品の全て
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product = CartProduct.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product = CartProduct.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    CartProduct.destroy_all
    redirect_to cart_products_path
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:quantity, :product_id, :customer_id)
    end
end
