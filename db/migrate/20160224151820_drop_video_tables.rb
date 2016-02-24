class DropVideoTables < ActiveRecord::Migration
  def change
    drop_table :video_tables
  end
end
