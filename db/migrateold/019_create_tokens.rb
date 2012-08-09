class CreateTokens < ActiveRecord::Migration
  def self.up
    create_table :tokens do |t|
      t.column:LocationID,:int	
      t.column:DQM_IPAddress,:string	
      t.column:SerialNo,:int	
      t.column:tokenno,:string
      t.column:tokenid,:string	
      t.column:ctypeid,:string
      t.column:transdate,:datetime	
      t.column:generatedtime,:string	
      t.column:serviceid,:string
      t.column:counterno,:int	
      t.column:accountno,:string
      t.column:login,:string
      t.column:calledtime,:string	
      t.column:servicedtime,:string
      t.column:timetaken,:string	
      t.column:waittime,:string	
      t.column:stpname,:string
      t.column:nonstpname,:string
      t.column:tokenstatus,:int
      t.column:pauseflag	,:int
      t.column:pausetime,:string
      t.column:releasetime,:string
      t.column:bulkcount,:int	
      t.column:reasons,:string
      t.column:call1,:string
      t.column:missingflag,:int
      t.column:pullcounter,:int	
      t.column:redirecttime,:string
    end
  end

  def self.down
    drop_table :tokens
  end
end
