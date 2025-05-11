class AddAddressToUsers < ActiveRecord::Migration[8.0]
  def change
    # c. Add NOT NULL column with empty default
    add_column :users, :address, :string, null: false, default: ""
  end
end
