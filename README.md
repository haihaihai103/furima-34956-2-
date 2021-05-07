# テーブル設計

## usersテーブル
 has_many :items
 has_many :delivery

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
 belongs_to :users
 has_one :customers

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
belongs_to :items
has_one : delivery

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

## deliveryテーブル
 belongs_to :users
 belongs_to :customers

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| postcode      | string  | null: false |
| state         | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| phone_number  | string  | null: false |
| building_name | string  |            |
| customer_id   | references | foreign_key: true|

 