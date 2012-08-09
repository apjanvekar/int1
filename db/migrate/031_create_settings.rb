class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
        t.column :purgingperiod, :int
    end
  end

  def self.down
    drop_table :settings
  end
end
