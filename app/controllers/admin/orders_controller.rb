class Admin::OrdersController < ApplicationController

    before_action :authenticate_admin!

    def index
      @orders = Order.page(params[:page]).reverse_order
    end

    def show
      @order = Order.find(params[:id])
    end

    def update #注文ステータスの更新
      @order = Order.find(params[:id])
      @order.update(order_params)
      if @order.payment_confirm? #enumの確認メソッド
        @order.order_details.each do |order_detail|
        order_detail.waiting_production! #enumの更新メソッド
      end
      end
      redirect_to admin_order_path

    end

    private
    def order_params
      params.require(:order).permit(:customer_id, :postage, :billing, :payment, :shipping_name, :shipping_post_cord, :shipping_address, :status)
    end
end
