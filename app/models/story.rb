class Story < ActiveRecord::Base
  belongs_to :location

  has_attached_file :audio, 
    storage: :s3,
    s3_credentials: { 
      access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    },
    bucket: ENV["FOG_DIRECTORY"],
    url: ":s3_domain_url",
    path: ":rails_env/:class/:filename"

  validates_attachment_content_type :audio, content_type: /\Aaudio/

  def to_builder
    Jbuilder.new do |story|
      story.id id
      story.date date
      story.title title
      story.description description
      story.storyteller storyteller
      story.location_id location_id
      story.audio audio.url
    end
  end
end
