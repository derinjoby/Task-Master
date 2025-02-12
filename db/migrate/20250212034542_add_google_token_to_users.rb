class AddGoogleTokenToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :google_token, :string
  end
end
