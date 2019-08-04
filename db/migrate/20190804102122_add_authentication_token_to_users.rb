class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string, limit: 30
    add_index :users, :token, unique: true
  end
end
