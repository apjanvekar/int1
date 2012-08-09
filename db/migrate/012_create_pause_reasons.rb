class CreatePauseReasons < ActiveRecord::Migration
  def self.up
    create_table :pause_reasons do |t|
      t.column:PR_PauseReasonID,:int
      t.column:PR_PauseReasonDesc,:string
      t.column:created_at,:datetime
      t.column:PR_CreatedBy,:int
      t.column:updated_at,:datetime
      t.column:PR_LastModifiedBy,:int

    end
  end

  def self.down
    drop_table :pause_reasons
  end
end
