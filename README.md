# テーブル設計

## users テーブル
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| encrypted_password | string  | null: false |
| last_name | string | null: false |
| first_name| string | null: false |
| last_name_kana| string | null: false |
| first_name_kana| string | null: false |
| birthday_yy| string | null: false |
| birthday_mm| string | null: false |
| birthday_dd| string | null: false |

## itemsテーブル
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| image  | ActiveStorage | null: false|
| title     | string | null: false |
| concept   | text   | null: false |
| category  | string | null: false |
| status    | string | null: false |
| burden    | string | null: false |
| area      | string | null: false |
| days_ship | string | null: false |
| price     | integer | null: false |
| user      | references |    |

## customersテーブル
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| user      | references|          |
| item      | references|          |

## deliveryテーブル
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| postcode  | integer| null: false |
| state    | string | null: false |
| city      | string | null: false |
| address   | string | null: false |
| phone_number | string | null: false |
| building_name | string | null: false |