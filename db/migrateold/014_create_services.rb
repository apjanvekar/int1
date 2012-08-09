class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.column:SVC_ServiceID,:int
      t.column:SVC_ServiceName,:string
      t.column:SVC_ServiceAcronym,:char
      t.column:SVC_GroupID,:int
      t.column:SVC_ThresholdTimeMins,:string
      t.column:SVC_ButtonNo,:int
      t.column:SVC_Priority,:int
      t.column:SVC_ServiceTypeID,:int
      t.column:SVC_FromHour,:int	
      t.column:SVC_FromMinute,:int
      t.column:SVC_ToHour,:int
      t.column:SVC_ToMinute,:int
      t.column:SVC_IsActive,:char
      t.column:created_at,:datetime
      t.column:SVC_CreatedBy,:int
      t.column:updated_at,:datetime
      t.column:SVC_LastModifiedBy,:int
    end
  end

  def self.down
    drop_table :services
  end
end
