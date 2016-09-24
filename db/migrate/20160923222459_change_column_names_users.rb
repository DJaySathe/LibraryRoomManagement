class ChangeColumnNamesUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users,  :email, :email
    rename_column :users, :role , :role
  end
end
