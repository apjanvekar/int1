class CreateOldPauseDets < ActiveRecord::Migration
  def self.up
    create_table :old_pause_dets do |t|
      t.column:CNTNo, :int
      t.column:UserID, :string
      t.column:PDate, :datetime
      t.column:STime, :datetime
      t.column:ETime, :datetime
      t.column:Reason, :char
      t.column:PS, :char
      t.column:LocationId, :int
    end
  end

  def self.down
    drop_table :old_pause_dets
  end
end
