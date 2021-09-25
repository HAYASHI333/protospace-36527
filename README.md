# テーブル設計

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| profile       | string | null: false |
| occupation    | text   | null: false |
| position      | text   | null: false |

- has_many :prototype
- has_many :comment
- has_many :users

##commentsテーブル
| Column    | Type        | Options |
| --------- | ----------- | ------- |
| text      | null: false | ------- |
| user      | references  | ------- |
| prototype | references  | ------- |

##prototypesテーブル
| Column     | Type          | Options     |
| ---------- | ------------- | ----------- |
| title      | string        | null: false |
| catch_copy | text          | null: false |
| concept    | text          | null: false |
| image      | ActiveStorage | ----------- |
| user       | references    | ----------- |