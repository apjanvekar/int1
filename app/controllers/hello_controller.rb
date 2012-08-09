class HelloController < ApplicationController
  
  wsdl_service_name 'Hello'
  web_service_api HelloApi
  web_service_scaffold :invoke
  
  def getData(tokenno,tokenid,ctypeid,transdate,generatedtime,serviceid,counterno,accno,login,calledtime,servicedtime,timetaken,waittime,stpname,nonstpname,tokenstatus,pausetime,releasetime,bulkcount,call1,reasons,actcode,soleid)
    
     @transdate_by_dqm=transdate.strftime("%m/%d/%Y")
     @generatedtime_by_dqm=generatedtime.strftime("%H:%M:%S")
     @calledtime_by_dqm=calledtime.strftime("%H:%M:%S")
     @servicedtime_by_dqm=servicedtime.strftime("%H:%M:%S")
     @timetaken_by_dqm=timetaken.strftime("%H:%M:%S")
     @waittime_by_dqm=waittime.strftime("%H:%M:%S")
     @pausetime_by_dqm=pausetime.strftime("%H:%M:%S")
     @releasetime_by_dqm=releasetime.strftime("%H:%M:%S")   
     
     if call1==nil
       puts "in if parts"
       @call1_by_dqm='00:00:00'
      else 
         @call1_by_dqm=call1.strftime("%H:%M:%S")   
       end   
       
        @dataold=Transact.count(:conditions=>["tokenno=? and serviceid=? and soleid=? and transdate=?",tokenno,serviceid,soleid,transdate])
                if  @dataold== 0 # Insert all values
                    @sdata=Transact.new      
                    @sdata.tokenno=tokenno
                    @sdata.tokenid=tokenid
                    @sdata.ctypeid=ctypeid
                    @sdata.transdate=transdate
                    @sdata.generatedtime="#{@transdate_by_dqm}"+" "+"#{@generatedtime_by_dqm}"
                    @sdata.serviceid=serviceid
                    @sdata.counterno=counterno
                    @sdata.accno=accno
                    @sdata.login=login
                    @sdata.calledtime="#{@transdate_by_dqm}"+" "+"#{@calledtime_by_dqm}"
                    @sdata.serviced="#{@transdate_by_dqm}"+" "+"#{@servicedtime_by_dqm}"
                    @sdata.timetaken="#{@transdate_by_dqm}"+" "+"#{@timetaken_by_dqm}"
                    @sdata.waittime="#{@transdate_by_dqm}"+" "+"#{@waittime_by_dqm}"
                    @sdata.stpname=stpname
                    @sdata.nonstpname=nonstpname
                    @sdata.tokenstatus=tokenstatus
                    @sdata.pausetime="#{@transdate_by_dqm}"+" "+"#{@pausetime_by_dqm}"
                    @sdata.releasetime="#{@transdate_by_dqm}"+" "+"#{@releasetime_by_dqm}"
                    @sdata.bulkcount=bulkcount
                    @sdata.call1="#{@transdate_by_dqm}"+" "+"#{ @call1_by_dqm}"
                    @sdata.reasons=reasons
                    @sdata.actcode=actcode
                    @sdata.soleid=soleid
                    @sdata.receivedtime=Time.now
                    if @sdata.save 
                               return "true"
                    end
                else #Update values
                     @id_transact=Transact.find(:first,:select=>"id",:conditions=>["tokenno=? and serviceid=? and soleid=? and transdate=?",tokenno,serviceid,soleid,transdate])# where tokenno=tokennno and soleid=soleid and serviceid=serviceid")
                      if Transact.update(@id_transact.id,{:tokenstatus=>tokenstatus,:stpname=>stpname,
                                                                        :login=>login,:counterno=>counterno,
                                                                        :serviced=>servicedtime,:calledtime=>calledtime,
                                                                        :nonstpname=>nonstpname,:pausetime=>pausetime,
                                                                        :waittime=>waittime,
                                                                        :releasetime=>releasetime,:bulkcount=>bulkcount,
                                                                        :timetaken=>timetaken})
                         return "true"
                      end
                end
   end  
end
