json.extract! user, :id, :name, :emailid, :usertype, :created_at, :updated_at
json.url user_url(user, format: :json)