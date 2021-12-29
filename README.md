# README

## usersテーブル

| Column               | Type       | Options                   |
| -------------------- | ---------- | ------------------------- |
| nickname             | string     | null: false               |
| email                | string     | null: false, unique: true |
| encrypted_password   | string     | null: false               |
| family_name          | string     | null: false               |
| first_name           | string     | null: false               |
| phonetic_family_name | string     | null: false               |
| phonetic_first_name  | string     | null: false               |
| birth_date           | date       | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| image                 | string     | null: false       |
| name                  | string     | null: false       |
| description           | text       | null: false       |
| category_id           | integer    | null: false       |
| condition             | string     | null: false       |
| delivery_charge       | string     | null: false       |
| shipment_source_id    | integer    | null: false       |
| shipment_days_id      | integer    | null: false       |
| price                 | integer    | null: false       |
| user                  | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| zipcode               | string     | null: false                    |
| shipment_source_id    | references | null: false, foreign_key: true |
| address1              | string     | null: false                    |
| address2              | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| order                 | references | null: false                    |

### Association
- has_many :orders

## ordersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item                  | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :address
- has_one :item