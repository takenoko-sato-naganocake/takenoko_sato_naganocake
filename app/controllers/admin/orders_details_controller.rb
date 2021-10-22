class Admin::OrderDetailsController < ApplicationController

    def update
        @order_ditail = OrderDetail.find(params[:id])
        if @order_detail.update(order_detail_params)
            redirect_to admin_order_path(@order_detail), notice: "製作ステータスを更新しました"
        else
            render :show, alert: "製作ステータスを更新できませんでした"
        end
    end

    private
    def order_detail_params
       params.require(:order_detail).permit(:product_id, :order_id, :quantity, :price, :production_status)
    end
end
