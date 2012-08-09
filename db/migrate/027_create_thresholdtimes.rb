class CreateThresholdtimes < ActiveRecord::Migration
  def self.up
 create_table :thresholdtimes do |t|
        t.column :ctypeid, :string
      t.column :ctypedesc, :string
      t.column :priority, :int
      t.column :thresholdtime, :datetime
    end
  end

  def self.down
    drop_table :thresholdtimes
  end
end
