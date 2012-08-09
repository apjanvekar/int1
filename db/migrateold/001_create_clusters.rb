class CreateClusters < ActiveRecord::Migration
  def self.up
    create_table :clusters do |t|
      t.column :CLST_ClusterID, :int
      t.column :CLST_ClusterName, :string
      t.column :CLST_RegionID, :int
      t.column :created_at, :datetime
      t.column :CLST_CreatedBy, :int
      t.column :updated_at, :datetime
      t.column :CLST_LastModifiedBy, :int
    end
  end

  def self.down
    drop_table :clusters
  end
end
