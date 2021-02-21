テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| store              | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| product                | string     | null: false                    |
| user                   | reference  | null: false, foreign_key: true |
| description            | text       | null: false                    |
| states                 | test       | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| region_id              | integer    | null: false                    |
| eta_id                 | integer    | null: false                    |
| price                  | integer    | null: false                    |

### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column  | Type     | Options                       |
| --------| -------- | ----------------------------- |
| user    | reference| null:false, foreign_key: true |
| item    | reference| null:false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| zip              | string     | null: false                   |
| region_id        | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     | null: false                   |
| phone            | integer    | null: false                   |
| order            | reference  | null:false, foreign_key: true |

- belongs_to :order