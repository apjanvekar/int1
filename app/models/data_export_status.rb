class DataExportStatus < ActiveRecord::Base
   
   def hello1()
  puts "hello**************************************************************"
    puts "**************OOOOOOOOOOOOOOOOOOOOOOOOOO*********************"
  #puts a
  puts "**************OOOOOOOOOOOOOOOOOOOOOOOOOO*********************"
  require 'mysql'
  mysql = Mysql.init()
 #puts session[:m]

         mysql.connect('132.147.160.123','shripad','shripad')
       mysql.select_db('DQMS_development')
       
         puts "IN DELETE BLOCK--------------------------------------------------"
         
          mysql.query("delete from servicesbkp")
         puts "done"
   


end
end
