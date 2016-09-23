json.extract! booking, :id, :bookingid, :userid, :roomid, :date, :time, :bookedby, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)