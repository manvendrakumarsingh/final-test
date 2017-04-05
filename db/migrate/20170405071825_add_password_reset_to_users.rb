class AddPasswordResetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_reset_token, :strings
    add_column :users, :password_reset_sent, :datetime
  end
end
