# README

## usersテーブル

| Column                | Type       | Options                   |
| --------------------- | ---------- | ------------------------- |
| nickname              | string     | null: false               |
| email                 | string     | null: false, unique: true |
| password              | string     | null: false               |
| password_confirmation | string     | null: false               |
| family_name           | string     | null: false               |
| first_name            | string     | null: false               |
| phonetic_family_name  | string     | null: false               |
| phonetic_first_name   | string     | null: false               |

### Association
- has_many :items
- has_many :orders
- has_one :address

## itemsテーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| image                 | string     | null: false       |
| name                  | string     | null: false       |
| description           | string     | null: false       |
| category              | string     | null: false       |
| condition             | string     | null: false       |
| delivery_charge       | string     | null: false       |
| shipment_source       | string     | null: false       |
| shipment_days         | string     | null: false       |
| price                 | string     | foreign_key: true |
| user                  | references | foreign_key: true |

### Association
- belongs_to :user
- has_many :items
- has_many :orders
- has_one :address

## addressesテーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| zipcode               | string     | null: false |
| prefecture            | string     | null: false |
| address1              | string     | null: false |
| address2              | string     | null: false |
| building_name         | string     |             |
| phone_number          | string     | null: false |

### Association
- has_one :item
- has_one :user

## ordersテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item                  | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |
| purchase_date         | datetime   | null: false                    |

### Association
- belongs_to :user
- has_one :item