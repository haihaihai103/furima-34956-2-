FactoryBot.define do
  factory :user do
    nickname { 'test' }
    last_name { '太郎' }
    first_name { '山田' }
    last_name_kana { 'タロウ' }
    first_name_kana { 'ヤマダ' }
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date { Faker::Date.birthday}
  end
end