json.array!(@users) do |user|
  json.extract! user, :id, :provider, :uid, :name, :oauth_token, :oauth_expires_at, :admin
  json.url user_url(user, format: :json)
end
