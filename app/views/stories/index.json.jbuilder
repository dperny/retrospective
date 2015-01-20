json.array!(@stories) do |story|
  json.extract! story, :id, :uploader, :date, :title, :description, :latitude, :longitude
  json.url story_url(story, format: :json)
end
