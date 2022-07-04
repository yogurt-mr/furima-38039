# README

# テーブル 設計

## usersテーブル
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| nickname           | string              | null: false               |
| password           | string              | null: false               |
| lastname           | string              | null: false               |
| firstname          | string              | null: false               |
| lastname_kana      | string              | null: false               |
| firstname_kana     | string              | null: false               |
| dob                | string              | null: false               |

### 関連
* has_many :products
* has_many :purchases

## productsテーブル
| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product_name                        | string     | null: false                    |
| description                         | text       | null: false                    |
| category                            | string     | null: false                    |
| product_status                      | string     | null: false                    |
| shipping_fee_id                     | number     | null: false                    |
| shipping_area_id                    | number     | null: false                    |
| shipping_days_id                    | number     | null: false                    |
| price                               | number     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### 関連
- belongs_to :user

## purchasesテーブル
| Column                    | Type       | Options                        |
|---------------------------|------------|--------------------------------|
| creditcard_number         | number     | null: false                    |
| creditcard_valid_month    | number     | null: false                    |
| creditcard_valid_year     | number     | null: false                    |
| creditcard_secret_code    | number     | null: false                    |
| zip_code                  | string     | null: false                    |
| address                   | string     | null: false                    |
| phone_number              | number     | null: false                    |
| product                   | references | null: false, foreign_key: true |
| user                      | references | null: false, foreign_key: true |

### 関連
- belongs_to :product
- belongs_to :user


