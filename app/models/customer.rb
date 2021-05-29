class Customer < ApplicationRecord

  belongs_to :item
  belongs_to :user_id
  has_one :delivery

  def index
    @customer_address = CustomerAddress.new
  end

  def create
    @customer_address = CustomerAddress.new(customer_params)
    if @customer_address.valid?
      @customer_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  
  def customer_params
    params.require(:customer_address).permit(:postal_code, :city, :address, :phone_number, :area_id, :building_name).merge(user_id: current_user.id)
  end
end
