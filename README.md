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

## アプリケーション概要
画像付きのメモを投稿できるサイトです。
過去に投稿した曖昧な記憶から投稿タイトル,メモ,関連タグ等で検索をかけて投稿内容を確認できることをコンセプトに作成しました。

<img width="1427" alt="スクリーンショット 2020-04-15 10.29.36.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/526620/fed39022-025b-daf7-6604-4eb0b61ab30b.png">


## 機能一覧
- ユーザー登録、ログイン機能
- グループ機能
- 新規投稿機能
- 投稿更新・削除機能
- 投稿検索機能
- ページネーション

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