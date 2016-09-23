class ChangeColumnNamesUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users,  :emailid, :email
    rename_column :users, :usertype , :role
  end
end
