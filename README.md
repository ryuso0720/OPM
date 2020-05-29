# README

# OP-M(アウトプットマネージャー)
[![Image from Gyazo](https://i.gyazo.com/e234c8dea61cbaf82ff7916927e9b8ae.png)](https://gyazo.com/e234c8dea61cbaf82ff7916927e9b8ae)

## App URL
https://op-m.herokuapp.com/

## ゲスト用アカウント
|email|password|
|---|---|
|guest@gmail.com|111111|

# アプリ概要
本アプリは、日々の学習と学習時間を記録することができます。
<br>
学習時間の管理とアウトプットすることがアプリの目的です。

## 1日の学習内容を振り返りメモ書きを行う。

## 1日の学習時間を記録しグラフで表示することができる。

## 日々学習している内容を記事にして投稿できる。




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

