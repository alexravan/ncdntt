class CreateCategoryTable < ActiveRecord::Migration
  def change
    create_table :category_tables do |t|
      t.string :category
    end
  end
end
