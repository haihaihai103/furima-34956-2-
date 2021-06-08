class CustomersController < ApplicationController
before_action :item_set
before_action :authenticate_user!, except: [:index]
before_action :sold_out_item, only: [:index]

  def index
    @customer_delivery = CustomerDelivery.new
  end

  def create
    @customer_delivery = CustomerDelivery.new(customer_params)
    if @customer_delivery.valid?
      pay_item
      @customer_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private 
  
  def customer_params
    params.require(:customer_delivery).permit(:postcode, :city, :address, :phone_number, :area_id, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if current_user.id == @item.user.id 
    redirect_to root_path if @item.customer.present?
    redirect_to root_path unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: customer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
