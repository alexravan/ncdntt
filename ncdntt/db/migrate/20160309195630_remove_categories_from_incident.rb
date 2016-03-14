class RemoveCategoriesFromIncident < ActiveRecord::Migration
  def change
  	remove_column :incidents, :category, :integer
  end

  def change
  	add_column :incidents, :category_id, :integer
  end
end
