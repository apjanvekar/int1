class CreateTokenNumbers < ActiveRecord::Migration
  def self.up
    create_table :token_numbers do |t|
      t.column:Expr1000,:int
      t.column:lastserved,:int	
      t.column:DrivePercent,:int	
      t.column:SystemAvailability, :string
      t.column:ActiveUserCount, :int
      t.column:LocationID, :int	
      t.column:ExportedFlag,:string
      t.column:VarTimeStamp,:datetime	
      t.column:PrinterPaperStatus,:string
      t.column:Gold,:int	
      t.column:Customer,:int
      t.column:NonCustomer,:int
      t.column:EmployeeNo,:int	
      t.column:Ratio,:int	
      t.column:SoleID,:string
      t.column:PendingRatio,:int

    end
  end

  def self.down
    drop_table :token_numbers
  end
end
