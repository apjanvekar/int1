class CreateTycheNewDqmBranches < ActiveRecord::Migration
  def self.up
    create_table :tyche_new_dqm_branches do |t|
      t.column:TYC_LocationID,:int	
      t.column:created_at,:datetime	
      t.column:TYC_CreatedBy	,:int	
      t.column:updated_at,:datetime	
      t.column:TYC_LastModifiedBy,:int	

    end
  end

  def self.down
    drop_table :tyche_new_dqm_branches
  end
end
