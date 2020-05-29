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
日々の学習をインプットだけではなく、アウトプットも行い
<br>
習慣付けることを目的としています。

## 1日の学習内容を振り返りメモ書きを行う。
[![Image from Gyazo](https://i.gyazo.com/27dd624fe347e5db31c9c4b6afa3a827.png)](https://gyazo.com/27dd624fe347e5db31c9c4b6afa3a827)
## 1日の学習時間を記録しグラフで表示することができる。
[![Image from Gyazo](https://i.gyazo.com/f33dfc18d467a819d4c434021f381e65.png)](https://gyazo.com/f33dfc18d467a819d4c434021f381e65)
## 日々学習している内容を記事にして投稿できる。
[![Image from Gyazo](https://i.gyazo.com/8aa812e07763da878ba9a69010b03fe7.png)](https://gyazo.com/8aa812e07763da878ba9a69010b03fe7)



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

