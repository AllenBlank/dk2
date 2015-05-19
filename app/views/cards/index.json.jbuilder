json.array!(@cards) do |card|
  json.extract! card, :id, :expansion_id, :card_type, :types, :colors, :name, :rarity, :cmc, :mana_cost, :text, :flavor, :artist, :rulings, :number, :power, :toughness, :reserved, :original_type, :original_text, :loyalty, :newest, :color_id, :formats
  json.url card_url(card, format: :json)
end
