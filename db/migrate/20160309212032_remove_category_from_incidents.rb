class RemoveCategoryFromIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :category, :integer
  end
end
