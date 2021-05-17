FactoryBot.define do
  factory :user do
    nickname { 'test' }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date { Faker::Date.birthday}
  end
end