class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name,:description,:category_id,:product_status_id,:shipping_fee_id,:shipping_area_id,:shipping_day_id,:price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @product.user
  end
end