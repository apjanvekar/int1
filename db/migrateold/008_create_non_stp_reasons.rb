class CreateNonStpReasons < ActiveRecord::Migration
  def self.up
    create_table :non_stp_reasons do |t|
      t.column:NSTP_NonSTPID, :int
      t.column:NSTP_NonSTPReason, :string
      t.column:NSTP_GroupID, :int
      t.column:created_at, :datetime
      t.column:NSTP_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:NSTP_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :non_stp_reasons
  end
end
