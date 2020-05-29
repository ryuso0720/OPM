# README

# op-m(アウトプットマネージャー)
[![Image from Gyazo](https://i.gyazo.com/e234c8dea61cbaf82ff7916927e9b8ae.png)](https://gyazo.com/e234c8dea61cbaf82ff7916927e9b8ae)
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|false, unique: true|
|password|string|null: false|
### Association
- has_one: personal
- has_many: posts
- has_many :likes

## personalsテーブル
|Column|Type|Options|
|------|----|-------|
|profile|text||
|icon_image|string||
|user|references|foreign_key: true|
### Association
- belong_to: user

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|today|date|null: false|
|time|integer|null: false|
|title|string|null: false|
|user|references|foreign_key: true|
### Association
- belong_to: user

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|body|text|null: false|
|time|integer|null: false|
|title|string|null: false|
|user|references|foreign_key: true|
### Association
- belong_to: user
- has_many: photos


## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|atrticle|references|foreign_key: true|
### Association
- belong_to: article

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|article|references|foreign_key: true|
### Association
- belong_to: article
- belong_to: user

