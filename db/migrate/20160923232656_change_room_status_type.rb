class ChangeRoomStatusType < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :status,  :string
  end
end
