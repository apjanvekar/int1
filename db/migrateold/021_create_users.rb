class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column:USR_UserName,:string
      t.column:login,:string
      t.column:password,:string
      t.column:USR_IsActive,:int		
      t.column:USR_Role,:string
      t.column:USR_GroupID,:int	
      t.column :USR_IsLogin,:string
      t.column :created_at,:datetime
      t.column :updated_at,:datetime
      t.column:USR_IsLogin,:char,:default=>'N'		
      

    end
    User.create(:USR_UserName => 'uttara',
    :login => 'admin',
  :password => 'sprylogic',
 :USR_IsActive=>'1',
  :USR_Role=>'Admin',
  :USR_GroupID=>'1',
  :USR_IsLogin=>'N'
  )
  end

  def self.down
    drop_table :users
  end
end
