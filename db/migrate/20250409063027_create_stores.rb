class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :address
      t.string :phone

      t.timestamps
    end

    add_index :stores, :name
  end
end
