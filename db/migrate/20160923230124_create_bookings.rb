class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :bookingid
      t.string :userid
      t.integer :roomid
      t.date :date
      t.string :time
      t.string :bookedby
      t.integer :status

      t.timestamps
    end
  end
end
