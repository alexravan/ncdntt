class RemoveUserIdFromIncident < ActiveRecord::Migration
  def change
        remove_column :incidents, :user_id, :integer
  end
end
