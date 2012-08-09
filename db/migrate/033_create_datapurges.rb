class CreateDatapurges < ActiveRecord::Migration
  def self.up
    create_table :datapurges do |t|
    end
  end

  def self.down
    drop_table :datapurges
  end
end
