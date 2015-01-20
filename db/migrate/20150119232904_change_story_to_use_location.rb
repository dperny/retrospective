class ChangeStoryToUseLocation < ActiveRecord::Migration
  def change
    # remove the location columns
    remove_column :stories, :latitude
    remove_column :stories, :longitude
    
    # add a reference to location, w/ foreign key
    add_column :stories, :location_id, :integer
    add_foreign_key :stories, :locations
  end
end
