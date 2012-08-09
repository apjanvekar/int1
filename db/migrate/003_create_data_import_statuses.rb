class CreateDataImportStatuses < ActiveRecord::Migration
  def self.up
    create_table :data_import_statuses do |t|
      t.column:IMP_LocationID, :string
      t.column:IMP_RegionID,:int
      t.column:IMP_Date, :datetime
      t.column:IMP_ImportCompleted, :char
      t.column:IMP_ErrorDescription, :string
      t.column:IMP_MachineStatus, :string
      t.column:created_at, :datetime
      t.column:IMP_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:IMP_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :data_import_statuses
  end
end
