class Admin::OrdersController < ApplicationController
    def index
      @customer = Cutomer.find(params[:id])
      @orders = @customer.orders
    end

    def show
      @order = Order.find(params[:id])
    end
    
    def update
      @order = Order.find(params[:id])
    end
    
    private
    def order_params
      params.require(:order).permit(:customer_id, :postage, :billing, :payment, :shipping_name, :shipping_post_cord, :shipping_address, :status)
    end
end
