class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.column:REG_RegionID,:int
      t.column:REG_RegionName,:string
      t.column:REG_ZoneID,:int
      t.column:created_at,:datetime
      t.column:REG_CreatedBy,:int
      t.column:updated_at,:datetime
      t.column:REG_LastModifiedBy,:int

    end
  end

  def self.down
    drop_table :regions
  end
end
