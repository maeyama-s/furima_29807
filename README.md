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

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| id     | integer | primary key |
| name   | string  | null: false |
| email  | string  | primary key |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| id         | integer    | primary key                    |
| user_id    | references | null: false, foreign_key: true |
| title      | string     | null: false                    |
| image      | text       |                                |
|explanation | text       | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchas

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| id         | integer    | primary key                    |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| contents   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| id               | integer    | primary key                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| shipping address | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
