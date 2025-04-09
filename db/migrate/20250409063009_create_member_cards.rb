class CreateMemberCards < ActiveRecord::Migration[8.0]
  def change
    create_table :member_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :card_number, null: false
      t.string :card_name
      t.date :issued_at
      t.date :expires_at

      t.timestamps
    end

    add_index :member_cards, :card_number, unique: true
  end
end
