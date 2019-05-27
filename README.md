# tundocker

### バージョン
[![Ruby](https://img.shields.io/badge/Ruby-2.5.0-red.svg)](https://docs.ruby-lang.org/ja/2.5.0/doc/index.html)
[![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-5.2.3-red.svg)](https://guides.rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-10.6.1-yellow.svg)](https://www.postgresql.org/)

### 概要
- プログラミングなどの学習をする際に参考書などを買って満足することがある人のためのサイト
- 消化していく本のみ登録し学習した内容を書き出していくことで積読を解消します。

### コンセプト
- SNSを活用して簡単に進捗を報告していく機能
- 他の人が考えたBookListを参考に質の高い学習を目指します。

### 機能
- ユーザー
  - [x] ユーザー登録、編集、削除
  - [x] ユーザーログイン、ログアウト
  - [x] Twitterアカウントを利用したログイン
  - [x] お気に入りにした記事、本のリストを表示
- 本の登録機能
  - [x] 本の登録、編集、削除
  - [x] 本を自身の積読として登録、削除する
  - [ ] 本の検索
  - [x] 本にタグをつける機能
- 本の学習記録記事機能
  - [x] 記事の作成、編集、削除
  - [x] markdownによる記事の作成
  - [x] 記事にいいねをつける機能
  - [ ] 自身の学習記録の中で全文検索
  - [x] 記事に対するコメントを書く機能
- 本のリスト作成機能
  - [x] リストの作成、編集、削除
  - [x] リスト自体にいいねをつける機能
  - [x] リストの本を自身の本として登録する機能
  - [ ] リストに登録する本の数を可変にする。
- 学習した量をTweetする機能
  - [ ] tweet用リンクテンプレート作成機能

### カタログ設計
https://docs.google.com/spreadsheets/d/1pXMDRlHGCzki-XH-6Krt-7bfg5JN9tx6vi7zmyai1qs/edit?usp=sharing

### テーブル定義
https://docs.google.com/spreadsheets/d/1pXMDRlHGCzki-XH-6Krt-7bfg5JN9tx6vi7zmyai1qs/edit#gid=1383315016

### 画面遷移図
https://docs.google.com/spreadsheets/d/1pXMDRlHGCzki-XH-6Krt-7bfg5JN9tx6vi7zmyai1qs/edit#gid=1956762831

### 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1pXMDRlHGCzki-XH-6Krt-7bfg5JN9tx6vi7zmyai1qs/edit#gid=56437265

#### 使用予定Gem
* ransack
* devise
* omniouth
* omniouth-twitter
* kaminari
* carrierwave
* mini_magick
* bootstrap
* dotenv-rails
* bullet
* squasher
* redcarpet
* coderay
* rubocop
* acts-as-taggable-on
* font-awesome-sass
