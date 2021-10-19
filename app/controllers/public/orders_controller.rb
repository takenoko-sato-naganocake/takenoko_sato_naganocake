class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shippings = current_customer.shippings
  end

  def confirm
    @order = Order.new(order_params) #受け取った注文情報
    @order.customer_id = current_customer.id #注文情報に自分のIDを入れる
    @order.postage = 800 #送料を設定する
    @cart_products = current_customer.cart_products #自分のカート内商品を取り出す
    @billing = @order.postage + @cart_products.price #請求額の合計を割り出す
    @customer_address = Shipping.where(customer_id: current_customer.id) #自分が現在登録している住所を取り出す
    
    if params[:delivery_address] == "0" #お届けの方法が自分の住所の時
      @shipping_name = current_customer.last_name + current_customer.first_name
      @shipping_post_cord = current_customer.post_cord
      @shipping_address = current_customer.address
    elsif params[:delivery_address] == "1" #お届けの方法が登録している住所の時
      @shipping_name = @customer_address.name
      @shipping_post_cord = @customer_address.post_cord
      @shipping_address = @customer_address.address
    elsif  params[:delivery_address] == "2" #新しいお届け先
      @shipping_name = @order.shipping_name
      @shipping_post_cord = @order.shipping_post_cord
      @shipping_address = @order.shipping_address
    end
  end

  def create
  end

  def complete
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def order_params
  params.require(:order).permit(:customer_id, :postage, :billng, :payment, :shipping_name, :shipping_post_cord, :shipping_address, :status)
  end
  
end
