class ModifyPasswordVerificationInUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password, :string
    remove_column :users, :confirm_password, :string
    add_column :users, :password_digest, :string
  end
end
