json.array!(@decks) do |deck|
  json.extract! deck, :id, :user_id, :format, :name, :description
  json.url deck_url(deck, format: :json)
end
