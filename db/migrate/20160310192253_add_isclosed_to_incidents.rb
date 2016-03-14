class AddIsclosedToIncidents < ActiveRecord::Migration
  def change
  	add_column :incidents, :is_closed, :boolean, default: false
  end
end
