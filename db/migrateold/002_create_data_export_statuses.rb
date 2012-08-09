class CreateDataExportStatuses < ActiveRecord::Migration
  def self.up
    create_table :data_export_statuses do |t|
      t.column:EXP_LocationID, :int
      t.column:EXP_RegionID, :int
      t.column:EXP_Date, :datetime
      t.column:EXP_MasterName, :string
      t.column:EXP_FullExport, :string
      t.column:EXP_ExportCompleted, :char
      t.column:EXP_ErrorDescription, :string
      t.column:EXP_MachineStatus, :string
      t.column:EXP_NoOfRecordsSent, :int
      t.column:EXP_NoOfRecordsConfirmed, :int
      t.column:created_at, :datetime
      t.column:EXP_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:EXP_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :data_export_statuses
  end
end
