class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string  :user_type,         null: false, default: 'registered'
      t.string  :unique_code,       unique: true
      t.string  :phone_number
      t.boolean :two_factor_enabled, null: false, default: false
      t.string  :two_factor_secret
      t.integer :coupon_balance,     null: false, default: 0
    end

    # 必要に応じてインデックスの追加
    add_index :users, :unique_code, unique: true
  end
end
