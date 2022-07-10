class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update,:destroy]

  def index
    @products = Product.all.order(created_at: "DESC")
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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    unless user_signed_in? && current_user.id == @product.user_id && @product.purchase == nil
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user_id && @product.purchase == nil
      @product.destroy
    end
    redirect_to root_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name,:description,:category_id,:product_status_id,:shipping_fee_id,:shipping_area_id,:shipping_day_id,:price,:image).merge(user_id: current_user.id)
  end

  # def contributor_confirmation
  #   redirect_to root_path unless current_user == @product.user
  # end
end