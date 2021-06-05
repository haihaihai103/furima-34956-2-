class CustomerDelivery
  include ActiveModel::Model
  attr_accessor :token, :user_id , :item_id, :postcode, :area_id, :city, :address, :phone_number, :building_name, :customer

  with_options presence: true do
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/} #, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    customer = Customer.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, area_id: area_id, city: city, address: address, phone_number: phone_number, building_name: building_name, customer_id: customer.id)
  end
  
end

