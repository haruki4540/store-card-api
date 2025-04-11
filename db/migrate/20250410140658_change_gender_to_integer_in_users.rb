class ChangeGenderToIntegerInUsers < ActiveRecord::Migration[6.1]
  def up
    # 1. 一時的なカラム temp_gender を integer 型で追加
    add_column :users, :temp_gender, :integer, default: 0, null: false, limit: 4

    # 2. 既存の gender カラムの値を temp_gender に変換して移行
    #    ※ ここでは、gender の値が文字列 ("1", "2", etc.) として格納されている前提です。
    execute <<-SQL.squish
      UPDATE users SET temp_gender = CAST(gender AS integer)
    SQL

    # 3. 古い gender カラムを削除
    remove_column :users, :gender

    # 4. temp_gender を gender にリネーム
    rename_column :users, :temp_gender, :gender
  end

  def down
    # ロールバック用：integer 型の gender を string 型に戻す
    add_column :users, :temp_gender, :string, default: '', null: false

    # integer を文字列にキャストして移行
    execute <<-SQL.squish
      UPDATE users SET temp_gender = CAST(gender AS text)
    SQL

    remove_column :users, :gender
    rename_column :users, :temp_gender, :gender
  end
end
