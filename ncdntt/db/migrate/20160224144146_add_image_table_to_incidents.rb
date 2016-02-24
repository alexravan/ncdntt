class AddImageTableToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :image_table, :integer
    add_column :incidents, :video_table, :integer
  end
end
