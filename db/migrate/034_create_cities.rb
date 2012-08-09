class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.column:cityname,:string
      t.column:LOC_ClusterID, :int
      t.column:ZONE_ZoneID,:string
      t.column:CLST_RegionID,:int
    end
  end

  def self.down
    drop_table :cities
  end
end
