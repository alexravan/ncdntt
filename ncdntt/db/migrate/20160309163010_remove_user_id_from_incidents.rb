class RemoveUserIdFromIncidents < ActiveRecord::Migration
  def change
  	drop_table :images
  	remove_column :incidents, :user_id, :integer
  end
end
