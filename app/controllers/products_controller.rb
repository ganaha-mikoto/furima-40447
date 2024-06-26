class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  
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
  
  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, :image ).merge(user_id: current_user.id)
  end
end