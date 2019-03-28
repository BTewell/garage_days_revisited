class AddPasswordVerificationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password, :string
    add_column :users, :confirm_password, :string
  end
end
