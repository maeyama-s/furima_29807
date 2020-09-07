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
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| family_name           | string  | null: false |
| first_name            | string  | null: false |
| family_name_katakana  | string  | null: false |
| first_name_katakana   | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | integer    | primary key                    |
| user        | references | null: false, foreign_key: true |
| title       | string     | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchases

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| id         | integer    | primary key                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| contents   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| id               | integer    | primary key                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses

## shipping_addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| id               | integer    | primary key |
| post_code        | integer    | null: false |
| city             | string     | null: false |
| adress           | string     | null: false |
| building_name    | string     | null: false |
| phone_number     | integer    | null: false |

### Association
- belongs_to :purchases

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
