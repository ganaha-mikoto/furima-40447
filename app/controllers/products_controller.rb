class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless @product.user == current_user
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.user == current_user
      @product.destroy
      redirect_to root_path, notice: '商品が削除されました。'
    else
      redirect_to root_path, alert: 'この商品を削除する権限がありません。'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: '商品が見つかりません。'
  end
end
