class AddUserTokenToCode < ActiveRecord::Migration
  def change
    add_column :codes, :user_token, :string
  end
end
