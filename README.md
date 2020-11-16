# 機能要件
- 管理者
  - ログイン
    - 管理者機能を使うには管理者アカウントでシステムにログインが必要です。    
  - 従業員管理
    - 作業員一覧表示
    - 従業員勤務時間確認
      - 作業員本月中勤務総期間を日割りで表示できます
      - 作業員に対して、本月中ある日の打刻履歴が見えます
    - 作業員削除
      - 作業員が削除されると、当該作業員の勤務履歴も一括削除されます
  - 勤務履歴管理
    - 管理者が過去の勤務記録を確認、変更、削除できます。  
  - アカウント編集
    - 管理者のユーザー名、メールアドレス、パスワード情報変更できます
  - ログアウト

- 従業員
  - 従業員として新規登録できます。
  - 従業員のアカウントでログインできます。
  - 従業員が個人情報変更できます（name,email,password）
  - 従業員が新規登録できます。
  - 従業員が日割りに今月のみ見えます
  - 従業員が新規登録できます。
  - 従業員が自分の個人情報のみ見えます
  - 従業員は「勤務開始」を押して「勤務終了」ボタンを押すと、その日の勤務時間を知ることができます。
    - 「勤務開始」二回以上を押すと、「勤務終了」が押さない限り、最後の「勤務開始」操作時間に準じます
    - 「勤務終了」二回以上を押すと、「勤務開始」が押さない限り、最後の「勤務終了」操作時間に準じます


  
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
  - 情報変更時、ユーザ認証機能 (未実装) 
#db table
* users(uid,name,email,isadmin,password)
* management(ontime,offtime,uid)
