 class FixColumName < ActiveRecord::Migration
  def self.up
    rename_column :sellprops, :type, :classificatiom
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
