json.array!(@teams) do |team|
  json.extract! team, :id, :name, :school, :teammate1, :teammate2
  json.url team_url(team, format: :json)
end
