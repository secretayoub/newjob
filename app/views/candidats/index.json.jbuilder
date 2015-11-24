json.array!(@candidats) do |candidat|
  json.extract! candidat, :id
  json.url candidat_url(candidat, format: :json)
end
