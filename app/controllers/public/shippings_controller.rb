class Public::ShippingsController < ApplicationController

    def index
        @customer = current_customer
        @shipping = Shipping.new
        @shippings = @customer.shippings
    end

    def create
        @customer = current_customer
        @shipping = Shipping.new(shipping_params)
        @shipping.customer_id = current_customer.id
    if
        @shipping.save
        flash[:notice] = "配送先を登録しました"
        redirect_to shippings_path
    else
        @shippings = @customer.shippings
        render :index
    end

    end

    def edit
       @shipping = Shipping.find(params[:id])
    end

    def update
        @shipping = Shipping.find(params[:id])
    if
        @shipping.update(shipping_params)
        flash[:notice] = "配送先情報を更新しました"
        redirect_to shippings_path
    else
        @shippings = Shipping.all
        render :edit
    end
    end

    def destroy
        shipping = Shipping.find(params[:id])
        shipping.destroy
        redirect_to shippings_path
    end

    private

    def shipping_params
        params.require(:shipping).permit(:post_cord, :address, :name)
    end

end

