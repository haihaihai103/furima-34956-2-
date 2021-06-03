class CustomersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(customer_params)
    if @user_item.valid?
      @user_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  
  def customer_params
    params.require(:user_item).permit(:postal_code, :city, :address, :phone_number, :area_id, :building_name).merge(user_id: current_user.id)
  end
end

