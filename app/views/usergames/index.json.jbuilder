json.array!(@usergames) do |usergame|
  json.extract! usergame, :id, :name, :email, :score, :rank, :ft, :path
  json.url usergame_url(usergame, format: :json)
end
