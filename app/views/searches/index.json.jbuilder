json.array!(@searches) do |search|
  json.extract! search, :id, :user_id, :name_field, :text_filed, :type_field, :format_field, :color_field, :color_exact_field, :sort_by_field, :sort_direction_field
  json.url search_url(search, format: :json)
end
