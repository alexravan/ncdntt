class OccuredAtNowAString < ActiveRecord::Migration
  def change
          add_column :incidents, :occured_at, :string
  end
end
