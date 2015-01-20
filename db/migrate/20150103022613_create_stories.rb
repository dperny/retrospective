class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.datetime :date
      t.string :title
      t.string :description
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end

    add_reference :stories, :user, index: true
  end
end
