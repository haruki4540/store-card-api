class AddMoreDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :furigana,  null: false, default: ''
      t.date   :birth_date, null: false, default: '1900-01-01'  # 適切なデフォルト値を設定
      t.string :gender,     null: false, default: ''
    end
  end
end
