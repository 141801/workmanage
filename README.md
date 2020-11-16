# demo用情報
## アクセス情報
* ip:34:84:150.9
* アカウント

| username | email | password | 身分 |
----|---- |----|----
| admin | admin@work.com | adminadmin | 管理者 |
| user1 | user1@work.com | 111111 | ユーザ1 |
| user2 | user2@work.com | 111111 | ユーザ2 |
| user3 | user3@work.com | 111111 | ユーザ3 |


# 要件定義
- 管理者
  - ログイン
    - 管理者機能を使うには管理者アカウントでシステムにログインが必要です   
  - 従業員管理
    - 作業員表示
      - 登録した作業員が一覧で表示します
    - 作業員削除
      - 作業員が削除されると、当該作業員の勤務履歴も一括削除されます
  - 勤務履歴管理
    - 管理者が過去の勤務記録を確認、変更、削除できます。 
  - 月間レポート
    - ある作業員に対して、本月中の勤務総時間が日ごとに表示できます
    - ある作業員に対して、本月中ある日の打刻履歴詳細が表示できます
  - アカウント編集
    - 管理者のユーザー名、メールアドレス、パスワード情報変更できます
  - ログアウト

- 従業員
  - 新規登録 
    - 従業員として新規登録できます
  - ログイン
    - 従業員のアカウントでログインできます
  - 月間レポート   
    - 従業員は自分の本月中勤務総時間が日ごとに確認できます
    - 従業員は自分の本月中ある日の打刻情報詳細が見えます
  - アカウント編集
    - 従業員が個人情報変更できます（name,email,password）
  - 勤務情報登録  
    - 勤務開始
      - 従業員は「勤務開始」を押して,開始時間が記録できます
      - 「勤務開始」連続で二回以上を押すと、最後の「勤務開始」操作時間を記録します
    - 勤務修了
      - 従業員は「勤務修了」を押して,修了時間が記録できます
      - 「勤務開始」を押さなくて「勤務終了」を押すと、勤務修了時間を記録しません
  - ログアウト

- セキュリティー
  - 権限範囲制御
    - 従業員が自分のアカウントと勤務情報のみ見えます  
  - 情報漏洩の防止策として、全てのユーザのパスワードを暗号化で保存
  - ユーザに対して入力値検証
    - ユーザ名
      - 最大２５文字、最小３文字 
      - 大文字と小文字を区別
      - ユニークな文字列
    - メールアドレス：
      - メールアドレス規範に合う文字列のみ入力 
      - 長さが最大１０５文字
      - ユニークな文字列
    - パスワード
      - 最小6文字（未実装）
      - 大文字英文字、小文字英文字、数値、特殊文字最小一文字入力（未実装）  
  - httpsで受け付けます (未実装)  
  - アカウント情報変更時、ユーザ認証機能 (未実装) 
# 基本設計
- 動作環境
  linux:debian10
  
- システム構成図（略）
- DBのER図（略）
- ページレイアウト（略）
# 詳細設計
## db  
情報を格納する表を定義します
* users  #ユーザー情報を管理する表 
```
create_table "users", force: :cascade do |t|
    t.string "username" 
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "password_digest"
  end
```
* worktimes #勤務情報を管理する表
```
  create_table "worktimes", force: :cascade do |t|
    t.datetime "ontime"
    t.datetime "offtime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"  #foreign key
  end
```
## model層 
usersとworktimesの"one-to-many"関係反映と各パラメーターの検証方法を定義します
* users 
```
class User < ApplicationRecord
  has_many :worktimes, dependent: :destroy
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
```
* worktimes
```
class Worktime < ApplicationRecord
   belongs_to :user
   validates  :user_id,presence: true
end
```
## controler層 
* users_controller.rb
* worktimes_controller.rb
* sessions_controller.rb
* pages_controller.rb
## view層
* users
* worktimes
* sessions
* pages

