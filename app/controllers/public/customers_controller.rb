class Public::CustomersController < ApplicationController
    
  def show
    @customer = current_customer
  end
  
  # def edit
  #   @customer = current_customer
  # end
  
  # def update
  #   @customer = current_customer
  #   if
  #   @customer.update(customer_params)
  #   flash[:notice] = "登録情報を更新しました"
  #   redirect_to public_customers_path
  #   else
  #   render :edit
  #   end
  # end
  
  def unsubclibe
    @customer = current_customer
  end
  
  def withdraw
   @customer = current_customer
   @current_customer.update(is_deleted: true)
   reset_session
   redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_cord, :address, :phone_number, :is_deleted, :email)
  end
end
