class AddAttachmentAudioToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :stories, :audio
  end
end
