json.extract! admin, :id, :name, :email, :password_digest, :ispreconfigured, :created_at, :updated_at
json.url admin_url(admin, format: :json)