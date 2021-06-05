FactoryBot.define do
  factory :customer_delivery do
    postcode { '123-4567' }
    area_id { 1 }
    city { '横浜市' }
    house_number { '青山1-1' }
    building_name { '東京ハイツ' }
    phone_number {'09012345678'}
  end
end