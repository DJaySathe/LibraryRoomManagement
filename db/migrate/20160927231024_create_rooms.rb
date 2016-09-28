class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :roomid
      t.integer :size
      t.string :building

      t.timestamps
    end
  end
end
