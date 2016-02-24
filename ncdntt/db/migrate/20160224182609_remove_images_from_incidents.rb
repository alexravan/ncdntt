class RemoveImagesFromIncidents < ActiveRecord::Migration
  def change
  	remove_column :incidents, :image_table, :integer
  	remove_column :incidents, :video_table, :integer
  end
end
