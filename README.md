# アプリ名

  ## ワケアリ野菜販売アプリ


# 概要

  ### 商品の出品と購入


# 本番環境

 ### https://order-app-33910.herokuapp.com/

 ### ログイン情報（テスト用）

  ###  ・ 出品者用Eメール : test7@gmail.com
  ###  ・ 出品者パスワード : testtest1
  ###  ・ 購入者用Eメール : test6@gmail.com
  ###  ・ 購入者パスワード : testtest1

# 制作背景

### コロナ禍において、飲食店が受ける影響は計り知れないものがあり、私が勤めていた店舗でも売り上げの激減という事態になりました。<br>そんな中、店舗を守るためにできることはできるだけ安く食材を仕入れ、原価率を減らすということでした。そのために会社が契約している業者だけでなく、自分で行ける範囲のお店で一円でも安い食材を仕入れるということを行っていました。<br>私の勤めていた会社はまだ体力のある方でしたので何とか持ち直しましたが、次々に閉店していく個人経営の店舗をみて何かできることはないだろうかと考えていました。<br>そんな時、インターネットで訳あり商品を販売しているサイトを見つけた時、少しでも安くし野菜を購入したい店舗側と、品質には問題ないがスーパーなどに出品することの出来ない訳あり商品を少々安くてもいいから売りたい農家側とを繋げることができれば、お互いにメリットが生まれるのではないかと考えこのアプリケーションを開発してみようと思いました。


# DEMO
  
 ## トップページ（商品一覧画面） 
  ![0de13996683d9abcafd0eb8a83716416](https://user-images.githubusercontent.com/77102175/111909171-8a521380-8a9f-11eb-926d-f918ae8044b1.gif)

 ## 新規登録動画
  ![0aaf44a9fd9b2896c8329b114d143dbf](https://user-images.githubusercontent.com/77102175/111907422-8f5f9480-8a98-11eb-80a2-04387bfc352e.gif)


 ## 商品出品動画
  ![11e022b00026c9a8d2b31e6c871fab1d](https://user-images.githubusercontent.com/77102175/111906981-aa310980-8a96-11eb-91cd-95d69f588cdf.gif)

 ## 詳細表示画面 ・編集・削除画面
  ![6ade9b370618dc884dca3de7ab84b39d](https://user-images.githubusercontent.com/77102175/111907619-802d1680-8a99-11eb-9208-db4af2042cf0.gif)

 ## 購入画面
  

 ## 検索一覧画面
  ![a9d9e1a3d715f3225e6db5879b1f4d10](https://user-images.githubusercontent.com/77102175/111908003-e0708800-8a9a-11eb-9416-d50610a5f093.gif)

 ## コメント投稿動画
  ![2cd3f3ae12a7a819dc04881f478e04af](https://user-images.githubusercontent.com/77102175/111907802-427cbd80-8a9a-11eb-96e9-6bb9e3b20fee.gif)


 ## マイページ画像
  ![80f2ffb285a1b40b237b8f8c03367ac7](https://user-images.githubusercontent.com/77102175/111908951-8a9ddf00-8a9e-11eb-8a83-9f2aa8a1e3fd.gif)
  


# 工夫したポイント
 
  ### ・シンプルで分かりやすい表示
  ### ・機能の選別（本当に必要だと思う機能以外追加しない）
  ### ・全て日本語で表示させる

# 使用技術

 ## バックエンド

  ### Ruby, Ruby on Rails

 ## フロントエンド

  ### HTML, CSS, SCSS, JavaScript, 

 ## Webサーバー（本番環境）
  
  ### heroku

 ## ソース管理

  ### GitHub, GitHubDesktop

 ## テスト

  ### RSpec

 ## エディタ
 
  ### VSCode

# 課題や今後追加したい機能
 ### ・S3機能追加
 ### ・出品機能のカラムの追加



# DB設計


## users テーブル

| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| store              | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments


## itemsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| product                | string     | null: false                    |
| user                   | reference  | null: false, foreign_key: true |
| description            | text       | null: false                    |
| states                 | text       | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| region_id              | integer    | null: false                    |
| eta_id                 | integer    | null: false                    |
| price                  | integer    | null: false                    |

### Association

- has_one :order
- belongs_to :user
- has_many :comments


## orders テーブル

| Column  | Type     | Options                       |
| --------| -------- | ----------------------------- |
| user    | reference| null:false, foreign_key: true |
| item    | reference| null:false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| zip              | string     | null: false                   |
| region_id        | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     | null: false                   |
| phone            | integer    | null: false                   |
| order            | reference  | null:false, foreign_key: true |

- belongs_to :order

## comments テーブル

| Column           | Type    | Options     |
| -----------------| --------| ------------|
| user_id          | integer | null: false |
| item_id          | integer | null: false |
| text             | text    | null: false |

### Association

- belongs_to :item
- belongs_to :user
