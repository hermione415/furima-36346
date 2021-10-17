## usersテーブル

| Column              | Type   | Options                   |
| --------------------| ------ | --------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| name                | string | null: false               |
| name_kana           | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_record

## itemsテーブル

| Column              | Type    | Options                        |
| --------------------| --------| -------------------------------|
| items_name          | string  | null: false                    |
| items_information   | text    | null: false                    |
| category            | string  | null: false                    |
| items_status        | string  | null: false                    |
| shipping_cost       | string  | null: false                    |
| shipping_area       | string  | null: false                    |
| days_to_ship        | integer | null: false                    |
| price               | integer | null: false                    |
| seller_name         | string  | null: false                    |

### Association
- has_one :purchase_record
- belongs_to :users

## purchase_recordテーブル

| Column              | Type   | Options                        |
| --------------------| ------ | -------------------------------|
| buyer_name          | string | null: false                    |
| items_name          | string | null: false                    |

### Association
- belongs_to :users
- belongs_to :items
- has_one :shipping_address

## shipping_addressテーブル

| Column           | Type    | Options                   |
| -----------------| ------- | --------------------------|
| postal_code      | integer | null: false               |
| prefectures      | string  | null: false               |
| municipalities   | string  | null: false               |
| address          | string  | null: false               |
| building_name    | string  | null: false               |
| telephone_number | integer | null: false               |

### Association
- belongs_to :purchase_record