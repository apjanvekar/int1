class Transacts < ActiveRecord::Migration
  def self.up
   create_table :transacts do |t|   
    t.column :tokenno, :string
    t.column :tokenid, :string
    t.column :ctypeid, :string
    t.column :transdate, :date
    t.column :generatedtime, :time
    t.column :serviceid, :string
    t.column :counterno, :string
    t.column :acc_no, :string
    t.column :login, :string
    t.column :calledtime, :time
    t.column :serviced, :time
    t.column :timetaken, :time
    t.column :waittime, :time
    t.column :stpname, :string
    t.column :nonstpname, :string
    t.column :tokenstatus, :string
    t.column :pausetime, :time
    t.column :releasetime, :time
    t.column :bulkcount, :string
    t.column :call1, :time
    t.column :reasons, :string  
    t.column :score, :float
    t.column :flag, :string
    t.column :branch,:string
t.column :receivedtime,:date       
   end    
  end

  def self.down
      drop_table :transacts

  end
end
