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
  ![](https://i.gyazo.com/dd313e12d6cbd0ebfc3a908f42dbf28a.jpg)


 ## 新規登録画面
  ![](https://i.gyazo.com/9353dab271e56d90ce34992681a301b4.jpg)

 ## 商品出品動画
  ![11e022b00026c9a8d2b31e6c871fab1d](https://user-images.githubusercontent.com/77102175/111906981-aa310980-8a96-11eb-91cd-95d69f588cdf.gif)

 ## 詳細表示画面 ・編集・削除画面
  ![](https://i.gyazo.com/f259456b966403cfa3e5f802c3e90a89.jpg)

  ![](https://i.gyazo.com/dd2ada73ca8153091fac5b4b036d14a1.jpg)

 ## 購入画面
  
  ![](https://i.gyazo.com/c0856102340ae32f9c7cb6ab1cbb485d.jpg)

  ![](https://i.gyazo.com/2a8eefccc20fbd3baafb65df88f73b04.jpg)

  ![](https://i.gyazo.com/65f47e907839dc8a2668db18c8d101b1.jpg)

 ## 検索一覧画面
  ![](https://i.gyazo.com/1e38339f2f9f8c4135f70759c52a4895.jpg)

 ## コメント投稿動画
  ![](https://i.gyazo.com/7e184e31f6bece435d7c20d71fd3c3fd.jpg)


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
