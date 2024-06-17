# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| first_name         | string | null: false                    |
| last_name          | string | null: false                    |
| first_name_kana    | string | null: false                    |
| last_name_kana     | string | null: false                    |
| birthday           | date   | null: false                    |

### Association
  - has_many :products
  - has_many :purchasers

## products テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category            | string     | null: false, default: '---'    |
| condition           | string     | null: false, default: '---'    |
| shipping_charge     | string     | null: false, default: '---'    |
| shipping_area       | string     | null: false, default: '---'    |
| shipping_days       | string     | null: false, default: '---'    |
| price               | integer    | null: false                    |

### Association

  - belongs_to :user
  - has_many :purchasers

## purchasers テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| user_id             | integer    | null: false, foreign_key: true |
| product_id          | integer    | null: false, foreign_key: true |

### Association

  - belongs_to :user
  - belongs_to :product


