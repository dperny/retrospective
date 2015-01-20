class AddStorytellerToStories < ActiveRecord::Migration
  def change
    add_column :stories, :storyteller, :string
  end
end
