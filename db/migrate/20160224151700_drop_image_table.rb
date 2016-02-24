class DropImageTable < ActiveRecord::Migration
  def change
    drop_table :image_tables
  end
end
