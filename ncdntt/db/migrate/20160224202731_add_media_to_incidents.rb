class AddMediaToIncidents < ActiveRecord::Migration
  def self.up
    add_attachment :incidents, :media
  end

  def self.down
    remove_attachment :incidents, :media
  end
end
