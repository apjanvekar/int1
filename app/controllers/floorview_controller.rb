class FloorviewController < ApplicationController
layout 'sidenew'
  def newfloor
    puts params[:search]
  end
  def ipselection
    @dqmip=Transact.find(:all, :select => 'DISTINCT soleid')
    #@dqmip=Transact.find_by_sql("SELECT DISTINCT Dqmip FROM transacts")
    puts @dqmip.inspect
    @transacts = @dqmip.paginate :per_page => 1, :page => params[:page]  
  end
  
 #/// //////////////////////////////Store Procedure code\\\\\\\\\\\\\\\\\\\\\\\ 
def store
require 'dbi'
begin
dbh=DBI.connect("DBI:ADO:Provider=SQLOLEDB;Data Source=dhanashree;Intitial Catalog=ABC; User Id=sa; Password=;")
puts "ggggggggggggggggggggggg"
dbh.execute("USE ABC")
puts "connection formed..........."
l="execute storeproc"
s=dbh.prepare(l)
puts "preeeeeeeeeee"
s.execute()
puts "rrrrrr uuuuuuuuuuu"

#s.execute( storeproc)
puts "procedure gets executed.............."
#uts gl=s.fetch_all()

puts "database gets connected..................."
        

       redirect_to :action => 'proc'
     end     
           
  end
end
