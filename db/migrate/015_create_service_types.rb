class CreateServiceTypes < ActiveRecord::Migration
  def self.up
    create_table :service_types do |t|
      t.column:STYP_ServiceTypeID,:char
      t.column:STYP_ServiceTypeName,:string
      t.column:created_at,:datetime	
      t.column:STYP_CreatedBy,:int
      t.column:updated_at,:datetime
      t.column:STYP_LastModifiedBy,:int      
    end
     ServiceType.create(:STYP_ServiceTypeID => '1',
    :STYP_ServiceTypeName => 'Cash'
  )
  ServiceType.create(:STYP_ServiceTypeID => '2',
    :STYP_ServiceTypeName => 'Non Cash'
  )
  end

  def self.down
    drop_table :service_types
  end
end
