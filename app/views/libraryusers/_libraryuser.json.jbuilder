json.extract! libraryuser, :id, :name, :email, :password_digest, :created_at, :updated_at
json.url libraryuser_url(libraryuser, format: :json)