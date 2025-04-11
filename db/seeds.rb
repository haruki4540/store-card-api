# db/seeds.rb
require 'securerandom'

# テスト用ユーザーの作成
User.create!(
  name: 'テスト一郎',
  furigana: 'テストいちろう',       # ふりがな（読み仮名）
  email: 'test@example.com',
  password: 'password123',
  user_type: 'registered',
  unique_code: SecureRandom.uuid,         # QRコード用の一意識別子
  membership_number: SecureRandom.hex(4),   # 例えば、8桁の16進数文字列を会員番号として利用
  phone_number: '08012345678',            # ハイフンなしもしくはフォーマット通りに統一
  birth_date: Date.new(1990, 1, 1),         # 生年月日（例：1990年1月1日）
  gender: 1,                         # 性別（例："male", "female" など要件に合わせる）
  two_factor_enabled: false,
  two_factor_secret: nil,
  coupon_balance: 100
)

puts "Test user created successfully!"
