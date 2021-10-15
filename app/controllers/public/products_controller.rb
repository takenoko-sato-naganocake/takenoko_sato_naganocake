class Public::ProductsController < ApplicationController
  before_action :ensure_active_product, only: [:update]

  def index
    @products = Product.page(params[:page]).per(8)
    @products_all = Product.all
    @genres = Genre.all
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

# 仮ーーーーーーーーーーー
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_path(@product)
  end
# ーーーーーーーーーーーーーーーーーーーーーー

  private


  def product_params
    params.require(:product).permit(:name, :price, :caption, :image_id, :is_active, :genre_id)
  end

  def ensure_active_product
    products = Product.joins(:genre).where(genres: { is_active: true }).where(is_active: true)
    unless products.any? { |p| p == Product.find(params[:id]) }
      redirect_back(fallback_location: root_path)
    end
  end

end
