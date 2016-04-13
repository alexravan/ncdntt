class AddIncidentIdToImages < ActiveRecord::Migration
  def change
  	add_column :images, :incident_id, :integer
  end
end
