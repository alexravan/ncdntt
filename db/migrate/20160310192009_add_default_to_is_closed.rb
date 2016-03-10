class AddDefaultToIsClosed < ActiveRecord::Migration
  def change
  	remove_column :incidents, :is_closed, :boolean
  end
end
