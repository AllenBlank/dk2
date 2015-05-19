json.array!(@synergies) do |synergy|
  json.extract! synergy, :id, :pile_id, :compliment_id
  json.url synergy_url(synergy, format: :json)
end
