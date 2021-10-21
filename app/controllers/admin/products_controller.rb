class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
      flash[:notice] = "商品を新規追加しました。"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
      flash[:notice] = "商品情報を更新しました。"
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :caption, :image, :is_active, :genre_id)
  end

end
