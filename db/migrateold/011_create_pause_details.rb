class CreatePauseDetails < ActiveRecord::Migration
  def self.up
    create_table :pause_details do |t|
      t.column:PD_PauseDetailID,:int
      t.column:PD_LocationID,:int
      t.column:PD_CounterNo,:int
      t.column:PD_BranchUser,:char
      t.column:PD_PauseTime,:datetime
      t.column:PD_ReleaseTime,:datetime
      t.column:PD_PauseReasonID,:int
      t.column:PD_PauseDate,:datetime
      t.column:PD_CreatedDate,:datetime
      t.column:PD_CreatedBy,:int
      t.column:PD_LastModifiedDate,:datetime
      t.column:PD_LastModifiedBy,:int
    end
  end

  def self.down
    drop_table :pause_details
  end
end
