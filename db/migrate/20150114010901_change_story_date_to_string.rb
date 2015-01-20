class ChangeStoryDateToString < ActiveRecord::Migration
  def change
    change_column :stories, :date, :string
  end
end
