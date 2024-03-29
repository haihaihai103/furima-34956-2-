# テーブル設計

## usersテーブル
 has_many :items
 has_many :customers
 has_many :user
 has_one :card
 has_many :comments

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false ,unique: true |
| encrypted_password | string  | null: false |
| last_name | string | null: false |
| first_name| string | null: false |
| last_name_kana| string | null: false |
| first_name_kana| string | null: false |
| birth_date| date | null: false |

## itemsテーブル
 belongs_to :user
 has_one :customer
 has_many :comments

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| title     | string | null: false |
| concept   | text   | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| burden_id | integer | null: false |
| area_id   | integer | null: false |
| days_ship_id | integer | null: false |
| price     | integer | null: false |
| user      | references | foreign_key:true |

## customersテーブル
belongs_to :item
belongs_to :user
has_one : delivery

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| user | references | foreign_key: true |
| item | references | foreign_key: true |

## deliveryテーブル 
belongs_to :customer

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| postcode      | string  | null: false |
| area_id       | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| phone_number  | string  | null: false |
| building_name | string  |            |
| customer  | references | foreign_key: true |

## sns_credentialsテーブル
belong_to :user

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| provider | string  | |
| uid      | string  | |
| user     | references  | foreign_key: true |

## cardテーブル
belong_to :user

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| cutomer_token | string  | null: false |
| user  | references| foreign_key: true |

## commentテーブル
belong_to :user
belong_to :item

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| text  | text|  |
| user  | references| foreign_key: true |
| item  | references| foreign_key: true |

 