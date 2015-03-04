json.array!(@stories) do |story|
  json.extract! story, :id, :date, :title, :description, :created_at, :updated_at, :storyteller, :location_id
  json.url story_url(story, format: :json)
end
