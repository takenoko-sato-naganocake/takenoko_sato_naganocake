class Admin::OrdersController < ApplicationController
    def index
      @orders = Order.page(params[:page]).reverse_order
    end

    def show
      @order = Order.find(params[:id])
    end
    
    def update
      @order = Order.find(params[:id])
      @order.update(order_params)
      redirect_to admin_order_path
      
    end
    
    private
    def order_params
      params.require(:order).permit(:customer_id, :postage, :billing, :payment, :shipping_name, :shipping_post_cord, :shipping_address, :status)
    end
end
