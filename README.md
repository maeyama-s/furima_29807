# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
#テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| id                    | integer | primary key |
| nickname              | string  | null: false |
| email                 | string  | primary key |
| encrypted_password    | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_katakana  | string  | null: false |
| first_name_katakana   | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| id                     | integer    | primary key                    |
| user                   | references | null: false, foreign_key: true |
| title                  | string     | null: false                    |
| explanation            | text       | null: false                    |
| price                  | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| category_id            | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| id       | integer    | primary key                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| contents | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| id     | integer    | primary key                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| id             | integer    | primary key |
| post_code      | string     | null: false |
| prefectures_id | integer    | null: false |
| city           | string     | null: false |
| adress         | string     | null: false |
| building_name  | string     |             |
| phone_number   | string     | null: false |

### Association
- belongs_to :purchase

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
