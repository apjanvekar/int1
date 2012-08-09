class CreateDqmvendors < ActiveRecord::Migration
  def self.up
    create_table :dqmvendors do |t|
      t.column:VND_VendorID, :int
      t.column:VND_VendorName, :string
      t.column:VND_Address, :string
      t.column:VND_ContactPersonName, :string
      t.column:VND_ContactEmailID, :string
      t.column:VND_Telephone, :string
      t.column:VND_Fax, :string
      t.column:created_at, :datetime
      t.column:VND_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:VND_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :dqmvendors
  end
end
