class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.column:GRP_GroupID, :int
      t.column:GRP_GroupName, :string
      t.column:GRP_GroupDescription, :string
      t.column:created_at, :datetime
      t.column:GRP_CreatedBy, :int
      t.column:updated_at, :datetime
      t.column:GRP_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :groups
  end
end
