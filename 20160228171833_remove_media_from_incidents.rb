class RemoveMediaFromIncidents < ActiveRecord::Migration
  def change
  	remove_column :incidents, :picture_file_name, :string
  	remove_column :incidents, :picture_content_type, :string
  	remove_column :incidents, :picture_file_size, :integer
  	remove_column :incidents, :picture_updated_at, :datetime
  end
end
