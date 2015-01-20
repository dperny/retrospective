class RemoveUsers < ActiveRecord::Migration
  def change
    drop_table :users

    remove_column :stories, :user_id
  end
end
