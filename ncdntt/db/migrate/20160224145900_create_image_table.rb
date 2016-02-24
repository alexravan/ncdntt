class CreateImageTable < ActiveRecord::Migration
  def change
    create_table :image_tables do |t|
      t.string :link
    end
  end
end
