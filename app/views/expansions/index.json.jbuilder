json.array!(@expansions) do |expansion|
  json.extract! expansion, :id, :name, :code, :block, :release_date
  json.url expansion_url(expansion, format: :json)
end
