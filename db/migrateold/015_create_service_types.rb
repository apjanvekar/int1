class CreateServiceTypes < ActiveRecord::Migration
  def self.up
    create_table :service_types do |t|
      t.column:STYP_ServiceTypeID,:char
      t.column:STYP_ServiceTypeName,:string
      t.column:STYP_CreatedDate,:datetime	
      t.column:STYP_CreatedBy,:int
      t.column:STYP_LastModifiedDate,:datetime
      t.column:STYP_LastModifiedBy,:int      
    end
  end

  def self.down
    drop_table :service_types
  end
end
