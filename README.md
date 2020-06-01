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

# 制作背景
学習はインプットを中心に行いますが記憶の定着にはアウトプットをした方が効果的だと言われてます。
<br>
特に人に教えるのが良いと言われいますがプライベートで人に教える機会ほとんどないです。
<br>
そこで学習アウトプット用のアプリを作ろうと考えました。
<br>
アウトプットすることにより学習意欲を向上させるアプリを目指しました。

# DEMO
## 学習のメモ書き
- メモ書きしたタイトルが表示されます
- タイトルをクリックすると右側にメモ内容が表示されます
[![Image from Gyazo](https://i.gyazo.com/674e679def87a1347762bd0a213e1daf.gif)](https://gyazo.com/674e679def87a1347762bd0a213e1daf)
## 記事の投稿
- 画像が５枚まで投稿可能でプレビューもされる。
- markdown記法が可能でプレビューもできる。
[![Image from Gyazo](https://i.gyazo.com/7796082e540fd0340c57fc032b0fd52c.gif)](https://gyazo.com/7796082e540fd0340c57fc032b0fd52c)
## お気に入り機能
- 投稿記事のいいね！ボタンを押すとお気に入りとしてマイページに表示される
[![Image from Gyazo](https://i.gyazo.com/6c9c85a73d8a51893cafc2354c72b199.gif)](https://gyazo.com/6c9c85a73d8a51893cafc2354c72b199)

# 工夫したポイント
## 1. 学習時間を記録しそれをグラフで表現することで、自身の学習時間の割合を把握することができる。
[![Image from Gyazo](https://i.gyazo.com/2c44f63071b49f0e398ac3936a84dbf1.gif)](https://gyazo.com/2c44f63071b49f0e398ac3936a84dbf1)
## 2. 自身が確認したいメモをすぐに見れるようタイトルをクリックしたらその画面で内容を確認できるようにした。
[![Image from Gyazo](https://i.gyazo.com/9b99c1ed2dac8ac7165d53b4314eaaec.gif)](https://gyazo.com/9b99c1ed2dac8ac7165d53b4314eaaec)
## 3. 記事投稿ではアウトプットの表現方法も工夫してもらいたかったのでマークダウン記法を使えるようにした。
[![Image from Gyazo](https://i.gyazo.com/e7d7c3b88c4b6b9b69357ffe0606b470.gif)](https://gyazo.com/e7d7c3b88c4b6b9b69357ffe0606b470)

# 苦労した点
1. 非同期通信を用いてたプレビュー機能
2. 画像複数投稿機能及び編集機能
3. ユーザーアイコン追加機能及び初期デフォルトアイコン表示
4. お気に入り(いいね！)した投稿の一覧表示

# このアプリ他と違うところ
### メモ書きと記事投稿のハイブリット
### 学習時間を記録しグラフで表示

# 使用技術
使用言語：Ruby 2.5.1・JavaScript
<br>
ツール：VSCode（Visual Studio Code）
<br>
フレームワーク：Ruby on Rails 5.2.4.3
<br>
ライブラリー：jQuery
<br>
タスク管理：GitHub

# 今後実装したい機能
- 投稿記事に対するコメント機能
- メモの整理機能
- 記事投稿の際、学習ジャンルを選択させてジャンル別に表示できる機能
<br>
反省点：今回はユーザー間のアプローチがいいね！のお気に入り機能のみとなってしまったので
他のユーザーにアクションできる機能を追加したいです。


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

