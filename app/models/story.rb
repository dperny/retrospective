class Story < ActiveRecord::Base
  belongs_to :location

  has_attached_file :audio, path: ":rails_env/:class/:filename"
  validates_attachment_content_type :audio, content_type: /\Aaudio/
  
  has_attached_file :image, path: ":rails_env/:class/image/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage/

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
