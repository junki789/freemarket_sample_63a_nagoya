
## usersテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false|
|tel|integer|null: false|
|password|string|null: false|
|birth_day|integer|null: false|
|birth_month|integer|null: false|
|birth_year|integer|null: false|
|self_introduce|string|------|


## Association
- has_many :items
- has_many :comments
- has_many :salers
- has_one :address


## Itemsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|name|string|null: false|
|content|text|-----|
|price|integer|null: false|
|prefecture_code|integer|null: false|
|status|integer|null: false,default: 0|
|upper_category|reference|null: false, foreign_key: true|
|middle_category|reference|null: false, foreign_key: true|
|lower_category|reference|null: false, foreign_key: true|
|size_type|reference|null: false, foreign_key: true|
|seller|reference|null: false, foreign_key: true|

## Association
- has_many :salers
- has_many :comments
- has_many :status
- has_many :item_images
- belongs_to:user
- belongs_to:size_type


## Item_imagesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|item|reference|null: false, foreign_key: true|
|image|varchar(255)|null: false|

## Association
- belongs_to :item


## Salersテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

## Association
- belongs_to :item
- belongs_to :user


## Commentsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|
|comment|text|null: false|

## Association
- belongs_to :item
- belongs_to :user


## Categoriesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|name|string|null: false|
|ancestry|string|-----|
|size|reference|null: false, foreign_key: true|

## Association
- has_many :items
- has_ancestry
- belongs_to :size


## Sizeテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|size|string|null: false|

## Association
- has_many :size_types
- has_many middle_categories


## Size_typeテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|name|string|null: false|
|size|reference|null: false, foreign_key: true|

## Association
- has_many :items
- belongs_to :size


## Brandsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|id|integer|PRIMARY_KEY|
|name|string|null: false|

## Association
- has_many :items


## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code1|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|town|string|-----|
|house_number|integer|-----|

### Association
- belongs_to :user
tesuto