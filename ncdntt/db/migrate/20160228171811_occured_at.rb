class OccuredAt < ActiveRecord::Migration
def change
        add_column :incidents, :occured_at, :datetime
        end
      end
