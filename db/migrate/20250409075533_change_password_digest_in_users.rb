class AddMembershipNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :membership_number, :string
    add_index  :users, :membership_number, unique: true
  end
end
