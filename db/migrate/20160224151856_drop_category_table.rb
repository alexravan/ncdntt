class DropCategoryTable < ActiveRecord::Migration
  def change
    drop_table :category_tables
  end
end
