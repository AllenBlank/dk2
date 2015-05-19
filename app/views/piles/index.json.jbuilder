json.array!(@piles) do |pile|
  json.extract! pile, :id, :card_id, :deck_id, :count, :board
  json.url pile_url(pile, format: :json)
end
