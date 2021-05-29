class CustomerDelivery
  include ActiveModel::Model
  attr_accessor :user_id , :item_id, :postcode, :area_id, :city, :address, :phone_number, :building_name, :customer

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :city
    validates :address
    validates :phone_number, format: {with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z}
  end
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    customer = Customer.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, address: address, phone_number: phone_number, building_name: building_name, customer_id: customer_id)
  end
  
end

