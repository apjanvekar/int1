class CreateStpReasons < ActiveRecord::Migration
  def self.up
    create_table :stp_reasons do |t|
      t.column:STP_STPID,:int
      t.column:STP_STPReason,	:string
      t.column:STP_ServiceID,	:int
      t.column:created_at,	:datetime
      t.column:STP_CreatedBy,:int
      t.column:updated_at,:datetime
      t.column:STP_LastModifiedBy,:int

    end
  end

  def self.down
    drop_table :stp_reasons
  end
end
