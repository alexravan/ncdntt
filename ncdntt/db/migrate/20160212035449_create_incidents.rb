class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title
      t.integer :user_id
      t.integer :category
      t.string :description
      t.integer :severity
      t.string :location
      t.boolean :is_closed
      t.datetime :date_closed
      t.string :closing_comment

      t.timestamps null: false
    end
  end
end
