class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all #カート内の全て
    @customer_cart_products = CartProduct.where(customer_id: current_customer.id) #自分がいれたカート内商品の全て
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @product = @cart_product.product
    if @cart_product.save
      redirect_to cart_products_path, notice: "カートに商品が入りました"
    else
      redirect_to product_path(@product), notice: "商品の個数を指定してください"
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_to cart_products_path, notice: "個数の変更が完了しました"
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.destroy
      redirect_to cart_products_path, notice: "商品の削除に成功しました"
    end
  end

  def destroy_all
    if CartProduct.destroy_all
      redirect_to cart_products_path, notice: "カート内を全て削除しました"
    end
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:quantity, :product_id, :customer_id)
    end
end
