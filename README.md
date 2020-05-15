# README

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|false, unique: true|
|password|string|null: false|
### Association
- has_one: personal
- has_many: posts
- has_many: comments
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
- has_many: comments
- has_many: likes
- has_many: images
- has_many: tag_posts
- has_many: tags, through: :tag_posts
- belong_to: user

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: tag_posts
- has_many: tags, through: :tag_posts

## tag_postテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belong_to: post
- belong_to: tag

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|post|references|foreign_key: true|
### Association
- belong_to: post

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|post|references|foreign_key: true|
### Association
- belong_to: post
- belong_to: user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|post|references|foreign_key: true|
### Association
- belong_to: post
- belong_to: user
