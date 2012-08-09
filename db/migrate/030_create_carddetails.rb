class CreateCarddetails < ActiveRecord::Migration
  def self.up
    create_table :carddetails do |t|
      t.column :bin, :string
      t.column :product, :string
      t.column :expiredate, :date
      t.column :priority, :int
    end
  end

  def self.down
    drop_table :carddetails
  end
end
