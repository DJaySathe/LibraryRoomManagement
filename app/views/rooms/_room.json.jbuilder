json.extract! room, :id, :roomid, :status, :size, :building, :created_at, :updated_at
json.url room_url(room, format: :json)