class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @product.user_id && @product.purchase == nil
      @purchase_form = PurchaseForm.new
    else
      redirect_to root_path
    end
  end

  def new
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_product
      @purchase_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:zip_code, :shipping_area_id, :city, :street_number, :building, :phone_number).merge(token: params[:card_token], product_id: params[:product_id], user_id: current_user.id)
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    puts ENV["PAYJP_SECRET_KEY"] + "aaaaa"
      Payjp::Charge.create(
        amount: @product.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
      
    end
end
