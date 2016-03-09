class AddCategoryIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :category_id, :integer
  end
end
