class OccuredAtString < ActiveRecord::Migration
  def change
          remove_column :incidents, :occured_at
  end
end
