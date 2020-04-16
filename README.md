# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# README

# MemorySearch

## アプリケーション概要
画像付きのメモを投稿できるサイトです。
過去に投稿した曖昧な記憶から投稿タイトル,メモ,関連タグ等で検索をかけて投稿内容を確認できることをコンセプトに作成しました。

<img width="1427" alt="スクリーンショット 2020-04-15 10.29.36.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/526620/fed39022-025b-daf7-6604-4eb0b61ab30b.png">

## 制作背景(意図)
- 覚えておきたい内容はメモアプリ等に入力しますがたくさんのメモで埋もれてしまい、必要な時に見つけられないことはないでしょうか。物の保管場所等、重要性は低いが思い出せないと困る…といった内容をこのアプリで保存することで、調べる時間を短縮できます。
 また、画像をメモに結びつけて保存できるアプリが少ないと感じたので画像とメモがパッと見て確認できるようなアプリにしました。


## 機能一覧
- ユーザー登録、ログイン機能
- グループ機能
- 新規投稿機能
- 投稿更新・削除機能
- 投稿検索機能
- 関連タグ機能
- ページネーション

## デプロイ先
http://52.192.218.20/

## テストアカウント
### Basic認証
- username: search-memo
- 0412

### ログイン
- メールアドレス: test@g-mail.com
- パスワード: 12345678

# DEMO
## 投稿・編集
### 画像
<img width="1427" alt="スクリーンショット 2020-04-16 12.40.43.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/526620/b696d73b-a7be-74d9-3ee2-e57891f2b752.png">

### GIF
https://i.gyazo.com/1f447ea41df5ae790a79e01194099ee2.gif
## 検索
### 画像
<img width="1427" alt="スクリーンショット 2020-04-16 12.41.15.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/526620/a3ea80e9-7113-ff43-6aca-a60e7571dde6.png">

### GIF
https://i.gyazo.com/887199d7930c99d3d8f8a08b21f21a18.gif

# 使用技術

## ■ 言語
### バックエンド
Ruby 2.5.1
### フロントエンド
jQuery 1.12.4

## ■ フレームワーク
Ruby on Rails 5.2.4.1

## ■ データベース
MySQL 5.6.43

## ◼︎ インフラ
AWS EC2
AWS S3

## ◼︎ デプロイ
Capistranoによる自動デプロイ

## ER Diagram
<img width="1248" alt="スクリーンショット 2020-04-14 22.49.02.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/526620/15e17e0f-bad0-1f9d-7d19-d1d42f256eb0.png">

## 課題
- グループ作成・更新時に他のユーザーを承認なしで追加できる
- １枚しか画像保存できない

## 別途実装予定
- パンくず機能
- グループ招待機能
- 画像複数枚投稿機能

# memory-search DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false, add_index :users, :name|
|image|string| |
### Association
- has_meny :contents
- has_meny :groups_users
- has_meny :groups,through: :groups_users

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
### Association
- has_meny :contents
- has_meny :groups_users
- has_meny :users,through: :groups_users

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## contentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text| |
|title|text|null: false, limit: 30|
|image|string| |
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group