class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
