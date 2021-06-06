FactoryBot.define do
  factory :customer_delivery do
    postcode { '123-4567' }
    area_id { 2 }
    city { '横浜市' }
    address { '青山1-1' }
    phone_number {'09012345678'}
    building_name { '東京ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end