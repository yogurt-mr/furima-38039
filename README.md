# README

# テーブル 設計

## usersテーブル
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| nickname           | string              | null: false               |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| dob                | date                | null: false               |

### 関連
* has_many :products
* has_many :purchases

## productsテーブル
| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product_name                        | string     | null: false                    |
| description                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| product_status_id                   | integer    | null: false                    |
| shipping_fee_id                     | integer    | null: false                    |
| shipping_area_id                    | integer    | null: false                    |
| shipping_day_id                     | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### 関連
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Column                    | Type       | Options                        |
|---------------------------|------------|--------------------------------|
| user                      | references | null: false, foreign_key: true |
| product                   | references | null: false, foreign_key: true |

### 関連
- belongs_to :user
- belongs_to :product
- has_one :shipping_address

# shipping_addresses
| Column                    | Type       | Options                        |
|---------------------------|------------|--------------------------------|
| zip_code                  | string     | null: false                    |
| prefecture                | integer    | null: false                    |
| city                      | string     | null: false                    |
| street_number             | string     | null: false                    |
| building                  | string     |                                |
| phone_number              | string     | null: false                    |
| purchase                  | references | null: false, foreign_key: true |

### 関連
- belongs_to :purchase
