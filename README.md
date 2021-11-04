## usersテーブル

| Column              | Type   | Options                   |
| --------------------| ------ | --------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana      | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column              | Type       | Options                        |
| --------------------| -----------| -------------------------------|
| items_name          | string     | null: false                    |
| items_information   | text       | null: false                    |
| category_id         | integer    | null: false                    |
| item_state_id       | integer    | null: false                    |
| shipcost_id         | integer    | null: false                    |
| shiparea_id         | integer    | null: false                    |
| daystoship_id       | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- has_one :purchase_record
- belongs_to :user

## purchase_recordsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | -------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column           | Type      | Options                      |
| -----------------| ----------| -----------------------------|
| order            | references|null: false, foreign_key: true|
| postal_code      | string    | null: false                  |
| prefecture_id    | integer   | null: false                  |
| municipalities   | string    | null: false                  |
| address          | string    | null: false                  |
| building_name    | string    |                              |
| telephone_number | string    | null: false                  |

### Association
- belongs_to :purchase_record