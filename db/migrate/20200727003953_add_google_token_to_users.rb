class AddGoogleTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :google_token, :string
  end
end
