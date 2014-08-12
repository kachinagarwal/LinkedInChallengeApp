json.array!(@users) do |user|
  json.extract! user, :id, :FirstName, :LastName, :UserId, :password, :email, :IsActive
  json.url user_url(user, format: :json)
end
