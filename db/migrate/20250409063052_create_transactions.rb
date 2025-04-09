class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :member_card, foreign_key: true  # 会員証がない場合はNULL可
      t.references :store, foreign_key: true          # 取引がどの店舗か（NULL可の場合もある）
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
