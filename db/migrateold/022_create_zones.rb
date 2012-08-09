class CreateZones < ActiveRecord::Migration
  def self.up
    create_table :zones do |t|
      t.column:ZONE_ZoneID,:int	
      t.column:ZONE_ZoneName,:string	
      t.column:ZONE_CreatedDate,:datetime	
      t.column:ZONE_CreatedBy,:string	
      t.column:updated_at,:datetime	
      t.column:ZONE_LastModifiedBy,:string

    end
  end

  def self.down
    drop_table :zones
  end
end
