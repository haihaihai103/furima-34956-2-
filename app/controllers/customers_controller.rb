class CustomersController < ApplicationController
before_action :item_set
before_action :authenticate_user!
before_action :card_set, only: [:index]
before_action :sold_out_item

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
    params.require(:customer_delivery).permit(:postcode, :city, :address, :phone_number, :area_id, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if current_user.id == @item.user.id || @item.customer.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @card = Card.find_by(user_id: current_user.id)
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      customer: @card.customer_token,    # トークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  #マイページにクレジットカード情報を入力していない場合、入力を促す
  def card_set
    @card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path if @card.nil?
  end 
  end

