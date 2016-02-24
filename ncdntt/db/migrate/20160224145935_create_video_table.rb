class CreateVideoTable < ActiveRecord::Migration
  def change
    create_table :video_tables do |t|
      t.string :link
    end
  end
end
