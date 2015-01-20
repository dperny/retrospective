class Story < ActiveRecord::Base
  belongs_to :location

  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: /\Aaudio/
end
