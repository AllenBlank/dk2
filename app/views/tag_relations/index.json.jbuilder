json.array!(@tag_relations) do |tag_relation|
  json.extract! tag_relation, :id, :tag_id, :pile_id, :deck_id, :synergy_id
  json.url tag_relation_url(tag_relation, format: :json)
end
