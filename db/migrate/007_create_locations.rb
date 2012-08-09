class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.column:LOC_LocationID, :int
      t.column:LOC_SoleID, :string
      t.column:LOC_BranchName, :string
      t.column:LOC_ClusterID, :int
      t.column:LOC_GroupID, :int
      t.column:LOC_NoOfEmployees, :int
      t.column:LOC_DQM_IPAddress, :string
      t.column:LOC_IsActive, :char
      t.column:LOC_ReasonForInactive, :string
      t.column:LOC_DQMVendorID, :int
      t.column:created_at,:datetime
      t.column:LOC_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:LOC_LastModifiedBy, :int
      t.column:LOC_CityID, :int
    end
  end

  def self.down
    drop_table :locations
  end
end
