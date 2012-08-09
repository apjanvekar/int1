class DatatransactController < ApplicationController
 layout 'sidenew'
 # before_filter :login_required
 def showlocation

    
    if params[:location][:LOC_ClusterID]==""
      session[:cid]=nil
            else
              session[:cid]=params[:location][:LOC_ClusterID]
      end
           render :update do |page|
              page.replace_html('import_div',:partial=>'import')
            end 
  end

 def showlocationexp
 
    
    if params[:location][:LOC_ClusterID]==""
      session[:cid]=nil
            else
              session[:cid]=params[:location][:LOC_ClusterID]
      end
           render :update do |page|
              page.replace_html('export_div',:partial=>'export')
            end 
  end
def new_locations
    #puts "------------------------------------"
    render :update do |page|
        bkp=params[:location][:id]
     
        #puts "********************************************"
        #puts params[:tables][:name]
        #puts "********************************************"
            #session[:table_data]=params[:tables][:name]
        #else
        #puts session[:data].to_a
        
        n=session[:data].to_a
        d=session[:data]
        f=bkp.length
        c=n.length
        for p in 0..(c-1)
            for h in 0..(f-1)
                if n[p]==bkp[h]
                    #msg="true"
                    #break if msg=="true"
                    #session[:data]=session[:data]-bkp[h].to_a
                    bkp=bkp.to_a-bkp[h].to_a
                end
            end
            #break if msg=="true"
        end
        if session[:data]!=nil 
            #if msg!="true"
                session[:data]=d.to_a+bkp.to_a#+params[:location][:id]
                #session[:m]= d.to_a+bkp.to_a
            #else
                #page.alert("Please Select Proper Values to add")
                #msg="false"
            #end
        else
            session[:data]=bkp
            #session[:m]=bkp
        end
            session[:m]=session[:data]
    
    
        page.replace_html('imp_but',:partial=>'buttons')
    end 
 
end



def new_locations1
     bkp=params[:location][:id]
   
       n=session[:data].to_a
        d=session[:data]
        f=bkp.length
      c=n.length
  
    
      for p in 0..(c-1)
     
      for h in 0..(f-1)
        if n[p]==bkp[h]
      
          break if msg=="true"
        end
        
      end
      break if msg=="true"
      end
      
      if session[:data]!=nil 
       
        

      if msg!="true"
       session[:data]=d.to_a+bkp.to_a#+params[:location][:id]
       
   
     
       #session[:m]= d.to_a+bkp.to_a
       else
         msg="false"
       end
              else
         session[:data]=bkp
         #session[:m]=bkp
       end
        session[:m]=session[:data]
       render :update do |page|
           page.replace_html('imp_but',:partial=>'buttons')
            end 
 
end
def new_locationsexp
           #@session['val'] ="false"

        #bkp=params[:location][:id]
        #session[:table_data]=params[:tables][:name]
        #else
    render :update do |page|
        bkp=params[:location][:id]
     
        #puts "********************************************"
        #puts params[:tables][:name]
        #puts "********************************************"
            #session[:table_data]=params[:tables][:name]
        #else
        #puts session[:data].to_a
        n=session[:data].to_a
        puts "--------------------"
        puts n
        puts "--------------------"        
        d=session[:data]
        f=bkp.length
        c=n.length
        for p in 0..(c-1)
            for h in 0..(f-1)
                if n[p]==bkp[h]
                    #msg="true"
                    #break if msg=="true"
                    #session[:data]=session[:data]-bkp[h].to_a
                    bkp=bkp.to_a-bkp[h].to_a
                end
            end
            #break if msg=="true"
        end
        if session[:data]!=nil 
            #if msg!="true"
                session[:data]=d.to_a+bkp.to_a#+params[:location][:id]
                #session[:m]= d.to_a+bkp.to_a
            #else
                #page.alert("Please Select Proper Values to add")
                #msg="false"
            #end
        else
            session[:data]=bkp
            #session[:m]=bkp
        end
        session[:m]=session[:data]
    
        page.replace_html('exp_but',:partial=>'expbuttons')
    end 
        
end
def new_locationsexp1
           
           bkp=params[:location][:id]
     
  
       #else
       n=session[:data].to_a
        d=session[:data]
        f=bkp.length
      c=n.length
      
      for p in 0..(c-1)
      
      
      for h in 0..(f-1)
        if n[p]==bkp[h]
         
          msg="true"
      
          break if msg=="true"
        end
        
      end
      break if msg=="true"
      end
      
      if session[:data]!=nil 
       
        

      if msg!="true"
       session[:data]=d.to_a+bkp.to_a#+params[:location][:id]
       
       
       
       #session[:m]= d.to_a+bkp.to_a
       else
         msg="false"
       end
              else
         session[:data]=bkp
         #session[:m]=bkp
       end
        session[:m]=session[:data]
    

       render :update do |page|
           page.replace_html('exp_but',:partial=>'expbuttons')
            end 
 
end
def remove_locations
 

  session[:rem]=params[:loc][:id]
  session[:check]="true"
 # b=session[:rem].to_a
  #a=session[:m].to_a
  #c=a-b
  session[:m]=session[:m]-session[:rem]
   render :update do |page|
           page.replace_html('imp_but',:partial=>'buttons')
            end 
          end
          
  
  def remove_locationsexp

  session[:rem]=params[:loc][:id]
  session[:checkr]="true"
 # b=session[:rem].to_a
  #a=session[:m].to_a
  #c=a-b
  session[:m]=session[:m]-session[:rem]
   render :update do |page|
           page.replace_html('exp_but',:partial=>'expbuttons')
            end 
          end
  
def refresh
  
   render :update do |page|
     page.alert("hello")
  page << "document.getElementById('progress_div').style.visibility = 'visible'"
  end
  end

def export
  render :update do |page|
  session[:true]="true"

  require 'mysql'
  mysql = Mysql.init()

 #This has all the locations id which are selected by the user in array format
  t=session[:m]
  


 
for i in 0..(t.length-1)
begin
  del="true"
    
      e=t[i].to_i
      u=Location.find_by_sql("select LOC_SoleID from locations where id=#{e}")
      for y in u
          a=y.LOC_SoleID
      end

        @ip=Location.find_by_sql("select LOC_DQM_IPAddress from locations where id=#{e}")
      for ip in @ip
        @ipadd=ip.LOC_DQM_IPAddress
        
      end
    d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
       mysql.connect(@ipadd,'stlqms4icici','stlqms4icici')
       mysql.select_db('DQMS_development')
       if del=="true"
         
         del="false"
          mysql.query("truncate servicesbkp")
          mysql.query("truncate stpsbkp")
          mysql.query("truncate nonstpsbkp")
          mysql.query("truncate auxreasonsbkp")
          mysql.query("truncate adsbkp")
          mysql.query("truncate displayscrollmsgsbkp")
          mysql.query("truncate customertypesbkp")
          mysql.query("truncate carddetailsbkp")
        end
        
        
       
       ########FOR SERVICES
   begin
      @services=Service.find(:all)
      ct=1
        @services.each do |s|
          id=s.id
           serviceid=s.SVC_ServiceID
          
          sid=s.SVC_ServiceAcronym
          servicename=s.SVC_ServiceName
          thresholdtime=s.SVC_ThresholdTimeMins
          w=thresholdtime.to_s[11,9]
    
          thresholdtime=w
          buttonno=s.SVC_ButtonNo
          priority=s.SVC_Priority
          servicestatus=s.SVC_IsActive
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          downloadeddate=Date.today
          starttime=s.SVC_FromHour.to_s+":"+s.SVC_FromMinute.to_s+":"+"00"
          endtime=s.SVC_ToHour.to_s+":"+s.SVC_ToMinute.to_s+":"+"00"
          if ct<=8
            ct=ct+1
          serviceflag=1
          else
            serviceflag=0
            end
      
          mysql.query("insert into servicesbkp(id,serviceid,servicename,thresholdtime,buttonno,priority,servicestatus,downloadeddate,starttime,endtime,created_on,updated_on,serviceflag,sid) values(#{id} ,'" + serviceid + "',\"#{servicename}\",'"+ thresholdtime +"',#{buttonno},#{priority},#{servicestatus},'#{downloadeddate}','"+ starttime +"','"+ endtime +"','#{created_on}','#{updated_on}',#{serviceflag},'#{sid}')")
         
       end
       ct=1
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="servicesbkp"
          @dataexp.EXP_FullExport="True"
     
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=Service.find_by_sql("Select count(*) as counter from services")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from servicesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  rescue Exception => exc
        
        @dataexp=DataExportStatus.new
        @dataexp.EXP_LocationID=a
                  @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
        @dataexp.EXP_Date=Date.today
        @dataexp.EXP_ExportCompleted='N'
        @dataexp.EXP_ErrorDescription=exc.message
        @dataexp.EXP_MasterName="servicesbkp"
        @dataexp.EXP_FullExport="False"
        
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
        noofcount=Service.find_by_sql("Select count(*) as counter from services")
              for ct in noofcount
                  no=ct.counter
              end
        @dataexp.EXP_NoOfRecordsSent=no
        result=mysql.query("select * from servicesbkp ")
        counter=0
              result.each do |c|
                  counter=counter+1
              end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
        @dataexp.save
  end
  ##SERVICE ENDS
  ###########FOR STP
  begin
        @stps=STPReason.find(:all)
          @stps.each do |s|
            
            id=s.id
          stpname=s.STP_STPReason
          
          @s=Service.find_first(["SVC_ServiceID=?",s.STP_ServiceID])
          
       
           serviceid=s.STP_ServiceID
          status='1'
          downloadeddate=Date.today
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          
          mysql.query("insert into stpsbkp(id,serviceid,stpname,downloadeddate,created_on,updated_on,status) values(#{id} ,'" + serviceid + "',\"#{stpname}\",'#{downloadeddate}','#{created_on}','#{updated_on}','#{status}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="stpsbkp"
          @dataexp.EXP_FullExport="True"
   
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=STPReason.find_by_sql("Select count(*) as counter from stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from stpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
               @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="stpsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from stpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ##STP ENDS
##NON STP STARTED
 begin
        @nstps=NonSTPReason.find(:all)
          @nstps.each do |s|
          id=s.id
          nonstpname=s.NSTP_NonSTPReason
          downloadeddate=Date.today
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          
          mysql.query("insert into nonstpsbkp(id,nonstpname,downloadeddate,created_on,updated_on) values(#{id} ,\"#{nonstpname}\",'#{downloadeddate}','#{created_on}','#{updated_on}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="nonstpsbkp"
          @dataexp.EXP_FullExport="True"
          
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=STPReason.find_by_sql("Select count(*) as counter from non_stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from nonstpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
             @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="nonstpsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from non_stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from nonstpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  #NON STP ENDS
  ##PAUSE REASONS OR AUXREASIONS
  begin
          @prs=PauseReason.find(:all)
          @prs.each do |s|
          id=s.id
          reasons=s.PR_PauseReasonDesc
          downloadeddate=Date.today
          auxcode=s.id

          
          mysql.query("insert into auxreasonsbkp(id,reasons,auxcode,downloadeddate) values(#{id} ,\"#{reasons}\",#{auxcode},'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="auxreasonsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=STPReason.find_by_sql("Select count(*) as counter from pause_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from auxreasonsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="auxreasonsbkp"
          @dataexp.EXP_FullExport="False"
                   commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from pause_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from auxreasonsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ##PAUSE REASONS OR AUXREASIONS ENDS
  #########
  ###ADS STARTS
  begin
          @prs=TokenBottomAd.find(:all)
          @prs.each do |s|
       
          adtext=s.BOT_AdMessage
          downloadeddate=Date.today
               
          mysql.query("insert into adsbkp(adtext,downloadeddate) values(\"#{adtext}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="adsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=TokenBottomAd.find_by_sql("Select count(*) as counter from token_bottom_ads")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from adsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="adsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from token_bottom_ads")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from adsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ## Display Token footer Ends
  
  ##Display scroll message started
   begin
          @prs=DisplayScrollMessage.find(:all)
          @prs.each do |s|
          
          scrollmsg=s.SCRL_DisplayScrollMessage
          downloadeddate=Date.today
             
          mysql.query("insert into displayscrollmsgsbkp(scrollmsg,downloadeddate) values(\"#{scrollmsg}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
     
   end
   for j in @f
   @g=j.CLST_RegionID

 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="displayscrollmsgsbkp"
          @dataexp.EXP_FullExport="True"
          
     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=TokenBottomAd.find_by_sql("Select count(*) as counter from display_scroll_messages")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from displayscrollmsgsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="displayscrollmsgsbkp"
          @dataexp.EXP_FullExport="False"
                   commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from display_scroll_messages")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from displayscrollmsgsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
 
  
  ##Display scroll message ended
  #Customer Bkp start
  begin
          @prs=Thresholdtime.find(:all)
          @prs.each do |s|
          id=s.id
          ctypeid=s.ctypeid
          ctypedesc=s.ctypedesc
          priority=s.priority
          thresholdtime=s.thresholdtime.strftime("%H:%M:%S")
          downloadeddate=Date.today
           mysql.query("insert into customertypesbkp(id,ctypeid,ctypedesc,priority,downloadeddate,thresholdtime ) values(#{id} ,'#{ctypeid}',\"#{ctypedesc}\",#{priority},'#{downloadeddate}','"+ thresholdtime +"')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
     
   end
   for j in @f
   @g=j.CLST_RegionID
  
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="customertypesbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=Thresholdtime.find_by_sql("Select count(*) as counter from thresholdtimes")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from customertypesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="customertypesbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=Thresholdtime.find_by_sql("Select count(*) as counter from thresholdtimes")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from customertypesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
        ###Customer Bkp ends
        ##For Card Details Start
        begin
         @prs=Carddetail.find(:all)
          @prs.each do |s|
          id=s.id
          bin=s.bin
          product=s.product
          expiredate=s.expiredate.strftime("%Y-%m-%d").to_s
          
          priority=s.priority.to_s
          downloadeddate=Date.today
               
          mysql.query("insert into carddetailsbkp(id,bin,product,expiredate,priority,downloadeddate) values(#{id},'"+ bin +"',\"#{product}\",'#{expiredate}','"+ priority+"','#{downloadeddate}')")
         
          
        end
           @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="carddetailsbkp"
          @dataexp.EXP_FullExport="True"
          
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=Carddetail.find_by_sql("Select count(*) as counter from carddetails")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          counter=0
          begin
          result=mysql.query("select * from carddetailsbkp ")
          
                result.each do |c|
                    counter=counter+1
                  end
                  
                  rescue
                  
          
        end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save

      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="carddetailsbkp"
          @dataexp.EXP_FullExport="False"
                   commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
    noofcount=Carddetail.find_by_sql("Select count(*) as counter from carddetails")
    for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
      counter=0
          begin
          result=mysql.query("select * from carddetailsbkp ")
          
                result.each do |c|
                    counter=counter+1
                  end
                  
                  rescue
                  
          
        end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
 
  end
        #For Card Deatils Ends
  session[:m]=nil


rescue Exception => exc
@dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
               @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="All Tables"
          @dataexp.EXP_FullExport="False"
                  commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          @dataexp.EXP_NoOfRecordsSent=0
          @dataexp.EXP_NoOfRecordsConfirmed=0
          @dataexp.save
        end
      end
      
          page.alert("Exporting Completed successfully")
	
   page.redirect_to url_for(:action=>'updateservicetobranchexport')
            end 
end

def import
      require 'mysql'
      mysql = Mysql.init()
      
      t=session[:m]
   
      for i in 0..(t.length-1)
        begin
            
            e=t[i].to_i
         
            
            u=Location.find_by_sql("select LOC_SoleID from locations where id=#{e}")
            for y in u
              a=y.LOC_SoleID
            end
            ct=0
            d=Date.today
            g=DataImportStatus.find_by_sql("select id from data_import_statuses where IMP_LocationID='#{a}' and IMP_Date='#{d}'")
            for it in g
            DataImportStatus.find(it.id).destroy
            end
  
 
     @ip=Location.find_by_sql("select LOC_DQM_IPAddress from locations where id=#{e}")
     for ip in @ip
     @ipadd=ip.LOC_DQM_IPAddress
   
    end
        mysql.connect(@ipadd,'stlqms4icici','stlqms4icici')
      mysql.select_db('DQMS_development')
      results = mysql.query("SELECT * from transactmaster where exported='FALSE'")
      
         results.each do |item|
      @token=Token.new
      @token.LocationID=a
      @token.DQM_IPAddress=@ipadd
      @token.SerialNo=item[0]
      @token.tokenno=item[1]
      @token.tokenid=item[2]
      @token.ctypeid=item[3]
      @token.transdate=item[4]
     
      @token.generatedtime=item[5]
      @token.serviceid=item[6]
        @token.counterno=item[7]
        @token.accountno=item[8]
        @token.login=item[9]
        @token.calledtime=item[10]
        @token.servicedtime=item[11]
        @token.timetaken=item[12]
        @token.waittime=item[13]
        @token.stpname=item[14]
        @token.nonstpname=item[15]
        @token.tokenstatus=item[16]
        @token.pauseflag=item[17]
        @token.pausetime=item[18]
        @token.releasetime=item[19]
        @token.bulkcount=item[20]
        @token.call1=item[21]
        @token.reasons=item[22]
        
        @token.missingflag=item[23]
        @token.pullcounter=item[24]
        @token.redirecttime=item[25]
    
      @token.save
      mysql.query("update transactmaster set exported='TRUE' where id=#{item[0]}")
      end
   
       @dataimp=DataImportStatus.new
     @dataimp.IMP_LocationID=a
     @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataimp.IMP_RegionID=@g
     @dataimp.IMP_Date=Date.today
     @dataimp.IMP_ImportCompleted='Y'
     @dataimp.IMP_ErrorDescription=""
    
       
     @dataimp.IMP_MachineStatus="Machine Connected"
    
     @dataimp.save
 
    rescue Exception => exc
  
     
     @dataimp=DataImportStatus.new
     @dataimp.IMP_LocationID=a
         @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataimp.IMP_RegionID=@g
     @dataimp.IMP_Date=Date.today
     @dataimp.IMP_ImportCompleted='N'
     @dataimp.IMP_ErrorDescription=exc.message
      
        commd="ping #{@ipadd}"
     y=system(commd)
     if y==true
     @dataimp.IMP_MachineStatus="Machine Connected"
     else
       @dataimp.IMP_MachineStatus="Machine Not Connected"
       end
   
     @dataimp.save
   end
   #end ####IF ENDS
   #end#inner for
     mysql.close()
  

  end


  session[:m]=nil
  session[:t]="true"
          render :update do |page|
              page.alert("Importing Completed successfully")
          page.redirect_to url_for(:action=>'updateservicetobranchimport')
          #page.replace_html('export_div',:partial=>'export')
          end 

end


   def update_regions
    # updates Region based on Zone selected

    
    #session[:nt]="true"
    region = Region.find_by_sql("select id, REG_RegionName from regions where REG_ZoneID = '#{params[:id]}'")
    cluster = ""
    

    
     
          session[:uimp]="true"
         render :update do |page|
            page.replace_html 'regions', :partial => 'regions', :object => region
       page.replace_html 'clusters', :partial => 'clusters', :object => cluster
        
      
    end
  end



       
      def update_clusters
         # updates Region based on Zone selected
  
  
    cluster = Cluster.find_by_sql("select id, CLST_ClusterName from clusters where CLST_RegionID = #{params[:id]}")
 
     

    
     
       
         render :update do |page|
            page.replace_html 'clusters', :partial => 'clusters', :object => cluster
        end
      end
      def importfailure
  @regions=Region.find(:all)
  @locations=Location.find(:all)
  
end
def showexpstatus

  #@radio1=params[:radio1]
@impstatus=params[:impstatus]
   
  @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
  
 
  
 
  
 
 

if params[:radio1]!=nil
  session[:all]="true"
  if params[:radio1]=="1"
    
      session[:allloc]="true"
      
      
      session[:loc]=nil
      session[:reg]=nil
      elsif params[:radio1]=="2"
        
        session[:reg]="true"
        
        session[:allloc]=nil
        session[:loc]=nil
        
        else
          
          session[:loc]="true"
          
          session[:allloc]=nil
          session[:reg]=nil
  end
else
   session[:allloc]=nil
   session[:reg]=nil
   session[:loc]=nil
 end
 
  if @start_date!=nil
    session[:impdate]=@start_date
    else
      session[:impdate]=nil
    end
    
    if @impstatus!=nil
      session[:impstat]=@impstatus
      else
        session[:impstat]=nil
        end
    
  render :update do |page|
    page << "document.getElementById('sub2').disabled=false;"
            page.replace_html 'expstat', :partial => 'expstat'
        end
      end
      def allimport

                
							  render :update do |page|
            
            page.replace_html('impstat',:partial=>'checkallimp')
        
        end
  
end

def allexport
  					  render :update do |page|
            
            page.replace_html('expstat',:partial=>'checkallexp')
        
        end
end
      def selectedexport
         require 'mysql'
        mysql = Mysql.init()

        t=params[:DataExportStatus][:id].to_a
        len=t.length
          
for i in 0..(len-1) do
begin
        e=t[i].to_i
       
      u=DataExportStatus .find_by_sql("select EXP_LocationID,EXP_MasterName from data_export_statuses where id=#{e}")
      for y in u
          a=y.EXP_LocationID
          b=y.EXP_MasterName
      end

        @ip=Location.find_by_sql("select LOC_DQM_IPAddress from locations where LOC_SoleID='#{a}'")
      for ip in @ip
        @ipadd=ip.LOC_DQM_IPAddress
        
      end
  
       mysql.connect(@ipadd,'stlqms4icici','stlqms4icici')
       mysql.select_db('DQMS_development')
       if b=="All Tables"
        
         d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
       ###Card Details Starts
        begin
         mysql.query("truncate carddetailsbkp")
          @prs=Carddetail.find(:all)
          @prs.each do |s|
          id=s.id
          bin=s.bin
          product=s.product
          expiredate=s.expiredate.strftime("%Y-%m-%d").to_s
          priority=s.priority.to_s
          downloadeddate=Date.today
               
          mysql.query("insert into carddetailsbkp(id,bin,product,expiredate,priority,downloadeddate) values(#{id},'"+ bin +"',\"#{product}\",'#{expiredate}','"+ priority+"','#{downloadeddate}')")
                    
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="carddetailsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
  
          noofcount=Carddetail.find_by_sql("Select count(*) as counter from carddetails")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          counter=0
          begin
          result=mysql.query("select * from carddetailsbkp ")
          
                result.each do |c|
                    counter=counter+1
                  end
                  
                  rescue
                  
          
        end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save


      rescue Exception => exc
           @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="carddetailsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
    noofcount=Carddetail.find_by_sql("Select count(*) as counter from carddetails")
    for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
      counter=0
          begin
          result=mysql.query("select * from carddetailsbkp ")
          
                result.each do |c|
                    counter=counter+1
                  end
                  
                  rescue
                  
          
        end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
 
  end
       ##Card Details Ends
       ##customer bkps starts
       begin
         mysql.query("truncate customertypesbkp")
          @prs=Thresholdtime.find(:all)
          @prs.each do |s|
          id=s.id
          ctypeid=s.ctypeid
          ctypedesc=s.ctypedesc
          priority=s.priority
          thresholdtime=s.thresholdtime.strftime("%H:%M:%S")
          downloadeddate=Date.today
           mysql.query("insert into customertypesbkp(id,ctypeid,ctypedesc,priority,downloadeddate,thresholdtime ) values(#{id} ,'#{ctypeid}',\"#{ctypedesc}\",#{priority},'#{downloadeddate}','"+ thresholdtime +"')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
     
   end
   for j in @f
   @g=j.CLST_RegionID

 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="customertypesbkp"
          @dataexp.EXP_FullExport="True"
          
     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=Thresholdtime.find_by_sql("Select count(*) as counter from thresholdtimes")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from customertypesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="customertypesbkp"
          @dataexp.EXP_FullExport="False"
                  commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=Thresholdtime.find_by_sql("Select count(*) as counter from thresholdtimes")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from customertypesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
        ###Customer Bkp ends
             ########FOR SERVICES
            begin
                    mysql.query("truncate servicesbkp")
                  @services=Service.find(:all)
                    @services.each do |s|
                      id=s.id
                      
                      serviceid=s.SVC_ServiceID
                      
                      servicename=s.SVC_ServiceName
                      
                      thresholdtime=s.SVC_ThresholdTimeMins
                      w=thresholdtime.to_s[11,9]
                     
                      thresholdtime=w
                      
                      buttonno=s.SVC_ButtonNo
                      
                      priority=s.SVC_Priority
                      
                      servicestatus=s.SVC_IsActive
                      
                      created_on=s.created_at.strftime("%Y-%m-%d")
                      
                      updated_on=s.updated_at.strftime("%Y-%m-%d")
                      
                      downloadeddate=Date.today
                      
                      
                      mysql.query("insert into servicesbkp(id,serviceid,servicename,thresholdtime,buttonno,priority,servicestatus,downloadeddate,created_on,updated_on) values(#{id} ,'" + serviceid + "',\"#{servicename}\",'"+ thresholdtime +"',#{buttonno},#{priority},#{servicestatus},'#{downloadeddate}','#{created_on}','#{updated_on}')")
                    end
                  @dataexp=DataExportStatus.new
                  @dataexp.EXP_LocationID=a
                  @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
                      for i in @e
                        @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
                      end
                          for j in @f
                              @g=j.CLST_RegionID
                          end
                  @dataexp.EXP_RegionID=@g
                  @dataexp.EXP_Date=Date.today
                  @dataexp.EXP_ExportCompleted='Y'
                  @dataexp.EXP_ErrorDescription=""
                  @dataexp.EXP_MasterName="servicesbkp"
                  @dataexp.EXP_FullExport="True"
            
                  @dataexp.EXP_MachineStatus="Machine Connected"
              
                    noofcount=Service.find_by_sql("Select count(*) as counter from services")
                          for ct in noofcount
                              no=ct.counter
                          end
                    @dataexp.EXP_NoOfRecordsSent=no
                    result=mysql.query("select * from servicesbkp ")
                    counter=0
                        result.each do |c|
                            counter=counter+1
                        end
                    @dataexp.EXP_NoOfRecordsConfirmed=counter
                    @dataexp.save
              rescue Exception => exc
                    
                    @dataexp=DataExportStatus.new
                    @dataexp.EXP_LocationID=a
                    @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
                      for i in @e
                          @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
                      end
                      for j in @f
                          @g=j.CLST_RegionID
                      end
                      @dataexp.EXP_RegionID=@g
                      @dataexp.EXP_Date=Date.today
                      @dataexp.EXP_ExportCompleted='N'
                      @dataexp.EXP_ErrorDescription=exc.message
                      @dataexp.EXP_MasterName="servicesbkp"
                      @dataexp.EXP_FullExport="False"
                           commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
                      noofcount=Service.find_by_sql("Select count(*) as counter from services")
                        for ct in noofcount
                          no=ct.counter
                        end
                      @dataexp.EXP_NoOfRecordsSent=no
                      result=mysql.query("select * from servicesbkp ")
                      counter=0
                        result.each do |c|
                            counter=counter+1
                        end
                      @dataexp.EXP_NoOfRecordsConfirmed=counter
                      @dataexp.save
                end
  ##SERVICE ENDS
   ###########FOR STP
  begin
            mysql.query("truncate stpsbkp")
        @stps=STPReason.find(:all)
          @stps.each do |s|
          id=s.id
          stpname=s.STP_STPReason
          serviceid=s.STP_ServiceID
          downloadeddate=Date.today
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          
          mysql.query("insert into stpsbkp(id,serviceid,stpname,downloadeddate,created_on,updated_on) values(#{id} ,'" + serviceid + "',\"#{stpname}\",'#{downloadeddate}','#{created_on}','#{updated_on}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="stpsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=STPReason.find_by_sql("Select count(*) as counter from stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from stpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
               @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="stpsbkp"
          @dataexp.EXP_FullExport="False"
                 commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from stpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ##STP ENDS
##NON STP STARTED
 begin
           mysql.query("truncate nonstpsbkp")
        @nstps=NonSTPReason.find(:all)
          @nstps.each do |s|
          id=s.id
          nonstpname=s.NSTP_NonSTPReason
          downloadeddate=Date.today
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          
          mysql.query("insert into nonstpsbkp(id,nonstpname,downloadeddate,created_on,updated_on) values(#{id} ,\"#{nonstpname}\",'#{downloadeddate}','#{created_on}','#{updated_on}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="nonstpsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=STPReason.find_by_sql("Select count(*) as counter from non_stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from nonstpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
             @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="nonstpsbkp"
          @dataexp.EXP_FullExport="False"
                       commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from non_stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from nonstpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  #NON STP ENDS
  ##PAUSE REASONS OR AUXREASIONS
  begin
            mysql.query("truncate auxreasonsbkp")
           @prs=PauseReason.find(:all)
          @prs.each do |s|
          id=s.id
          reasons=s.PR_PauseReasonDesc
          downloadeddate=Date.today

          
          mysql.query("insert into auxreasonsbkp(id,reasons,downloadeddate) values(#{id} ,\"#{reasons}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="auxreasonsbkp"
          @dataexp.EXP_FullExport="True"
 
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=STPReason.find_by_sql("Select count(*) as counter from pause_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from auxreasonsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="auxreasonsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from pause_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from auxreasonsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ##PAUSE REASONS OR AUXREASIONS ENDS
###ADS STARTS
  begin
             mysql.query("truncate adsbkp")
          @prs=TokenBottomAd.find(:all)
          @prs.each do |s|
         
          adtext=s.BOT_AdMessage
          downloadeddate=Date.today
               
          mysql.query("insert into adsbkp(adtext,downloadeddate) values(\"#{adtext}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="adsbkp"
          @dataexp.EXP_FullExport="True"
   
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=TokenBottomAd.find_by_sql("Select count(*) as counter from token_bottom_ads")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from adsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="adsbkp"
          @dataexp.EXP_FullExport="False"
          commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from token_bottom_ads")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from adsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ## Display Token footer Ends
  
  ##Display scroll message started
   begin
          mysql.query("truncate displayscrollmsgsbkp")
          @prs=DisplayScrollMessage.find(:all)
          @prs.each do |s|
         
          scrollmsg=s.SCRL_DisplayScrollMessage
          downloadeddate=Date.today
              
          mysql.query("insert into displayscrollmsgsbkp(scrollmsg,downloadeddate) values(\"#{scrollmsg}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
     
   end
   for j in @f
   @g=j.CLST_RegionID

 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="displayscrollmsgsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=TokenBottomAd.find_by_sql("Select count(*) as counter from display_scroll_messages")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from displayscrollmsgsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="displayscrollmsgsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from display_scroll_messages")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from displayscrollmsgsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
 
  #######################################################
  ##Display scroll message ended
  elsif b=="carddetailsbkp"
   
    ###Card Details Starts
     d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
        begin
         mysql.query("truncate carddetailsbkp")
          @prs=Carddetail.find(:all)
          @prs.each do |s|
          id=s.id
          bin=s.bin
          product=s.product
          expiredate=s.expiredate.strftime("%Y-%m-%d").to_s
          priority=s.priority.to_s
          downloadeddate=Date.today
               
          mysql.query("insert into carddetailsbkp(id,bin,product,expiredate,priority,downloadeddate) values(#{id},'"+ bin +"',\"#{product}\",'#{expiredate}','"+ priority+"','#{downloadeddate}')")
                    
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="carddetailsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=Carddetail.find_by_sql("Select count(*) as counter from carddetails")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          counter=0
          begin
          result=mysql.query("select * from carddetailsbkp ")
          
                result.each do |c|
                    counter=counter+1
                  end
                  
                  rescue
                  
          
        end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save


      rescue Exception => exc
           @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="carddetailsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
    noofcount=Carddetail.find_by_sql("Select count(*) as counter from carddetails")
    for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
      counter=0
          begin
          result=mysql.query("select * from carddetailsbkp ")
          
                result.each do |c|
                    counter=counter+1
                  end
                  
                  rescue
                  
          
        end
        @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
 
  end
       ##Card Details Ends

    elsif b=="customertypesbkp"
      ##customer bkps starts
      d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
       begin
         mysql.query("truncate customertypesbkp")
          @prs=Thresholdtime.find(:all)
          @prs.each do |s|
          id=s.id
          ctypeid=s.ctypeid
          ctypedesc=s.ctypedesc
          priority=s.priority
          thresholdtime=s.thresholdtime.strftime("%H:%M:%S")
          downloadeddate=Date.today
           mysql.query("insert into customertypesbkp(id,ctypeid,ctypedesc,priority,downloadeddate,thresholdtime ) values(#{id} ,'#{ctypeid}',\"#{ctypedesc}\",#{priority},'#{downloadeddate}','"+ thresholdtime +"')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
     
   end
   for j in @f
   @g=j.CLST_RegionID

 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="customertypesbkp"
          @dataexp.EXP_FullExport="True"
 
     @dataexp.EXP_MachineStatus="Machine Connected"
  ###################################k
          noofcount=Thresholdtime.find_by_sql("Select count(*) as counter from thresholdtimes")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from customertypesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="customertypesbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=Thresholdtime.find_by_sql("Select count(*) as counter from thresholdtimes")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from customertypesbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
        ###Customer Bkp ends
        elsif b=="servicesbkp"
           ########FOR SERVICES
           d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
            begin
                    mysql.query("truncate servicesbkp")
                  @services=Service.find(:all)
                    @services.each do |s|
                      id=s.id
                      
                      serviceid=s.SVC_ServiceID
                      
                      servicename=s.SVC_ServiceName
                      
                      thresholdtime=s.SVC_ThresholdTimeMins
                      w=thresholdtime.to_s[11,9]
                    
                      thresholdtime=w
                      
                      buttonno=s.SVC_ButtonNo
                      
                      priority=s.SVC_Priority
                      
                      servicestatus=s.SVC_IsActive
                      
                      created_on=s.created_at.strftime("%Y-%m-%d")
                      
                      updated_on=s.updated_at.strftime("%Y-%m-%d")
                      
                      downloadeddate=Date.today
                      
                      
                      mysql.query("insert into servicesbkp(id,serviceid,servicename,thresholdtime,buttonno,priority,servicestatus,downloadeddate,created_on,updated_on) values(#{id} ,'" + serviceid + "',\"#{servicename}\",'"+ thresholdtime +"',#{buttonno},#{priority},#{servicestatus},'#{downloadeddate}','#{created_on}','#{updated_on}')")
                    end
                  @dataexp=DataExportStatus.new
                  @dataexp.EXP_LocationID=a
                  @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
                      for i in @e
                        @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
                      end
                          for j in @f
                              @g=j.CLST_RegionID
                          end
                  @dataexp.EXP_RegionID=@g
                  @dataexp.EXP_Date=Date.today
                  @dataexp.EXP_ExportCompleted='Y'
                  @dataexp.EXP_ErrorDescription=""
                  @dataexp.EXP_MasterName="servicesbkp"
                  @dataexp.EXP_FullExport="True"
          
                  @dataexp.EXP_MachineStatus="Machine Connected"
             
                    noofcount=Service.find_by_sql("Select count(*) as counter from services")
                          for ct in noofcount
                              no=ct.counter
                          end
                    @dataexp.EXP_NoOfRecordsSent=no
                    result=mysql.query("select * from servicesbkp ")
                    counter=0
                        result.each do |c|
                            counter=counter+1
                        end
                    @dataexp.EXP_NoOfRecordsConfirmed=counter
                    @dataexp.save
              rescue Exception => exc
                    
                    @dataexp=DataExportStatus.new
                    @dataexp.EXP_LocationID=a
                    @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
                      for i in @e
                          @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
                      end
                      for j in @f
                          @g=j.CLST_RegionID
                      end
                      @dataexp.EXP_RegionID=@g
                      @dataexp.EXP_Date=Date.today
                      @dataexp.EXP_ExportCompleted='N'
                      @dataexp.EXP_ErrorDescription=exc.message
                      @dataexp.EXP_MasterName="servicesbkp"
                      @dataexp.EXP_FullExport="False"
                            commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
                      noofcount=Service.find_by_sql("Select count(*) as counter from services")
                        for ct in noofcount
                          no=ct.counter
                        end
                      @dataexp.EXP_NoOfRecordsSent=no
                      result=mysql.query("select * from servicesbkp ")
                      counter=0
                        result.each do |c|
                            counter=counter+1
                        end
                      @dataexp.EXP_NoOfRecordsConfirmed=counter
                      @dataexp.save
                end
  ##SERVICE ENDS
  elsif b=="stpsbkp"
    ###########FOR STP
    d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
  begin
            mysql.query("truncate stpsbkp")
        @stps=STPReason.find(:all)
          @stps.each do |s|
          id=s.id
          stpname=s.STP_STPReason
          serviceid=s.STP_ServiceID
          downloadeddate=Date.today
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          
          mysql.query("insert into stpsbkp(id,serviceid,stpname,downloadeddate,created_on,updated_on) values(#{id} ,'" + serviceid + "',\"#{stpname}\",'#{downloadeddate}','#{created_on}','#{updated_on}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="stpsbkp"
          @dataexp.EXP_FullExport="True"
  
     @dataexp.EXP_MachineStatus="Machine Connected"
    
          noofcount=STPReason.find_by_sql("Select count(*) as counter from stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from stpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
               @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="stpsbkp"
          @dataexp.EXP_FullExport="False"
                  commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from stpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ##STP ENDS
  elsif b=="nonstpsbkp"
    ##NON STP STARTED
    d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
 begin
           mysql.query("truncate nonstpsbkp")
        @nstps=NonSTPReason.find(:all)
          @nstps.each do |s|
          id=s.id
          nonstpname=s.NSTP_NonSTPReason
          downloadeddate=Date.today
          created_on=s.created_at.strftime("%Y-%m-%d")
          updated_on=s.updated_at.strftime("%Y-%m-%d")
          
          mysql.query("insert into nonstpsbkp(id,nonstpname,downloadeddate,created_on,updated_on) values(#{id} ,\"#{nonstpname}\",'#{downloadeddate}','#{created_on}','#{updated_on}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="nonstpsbkp"
          @dataexp.EXP_FullExport="True"
   
     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=STPReason.find_by_sql("Select count(*) as counter from non_stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from nonstpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
             @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="nonstpsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from non_stp_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from nonstpsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  #NON STP ENDS
elsif b=="auxreasonsbkp"
  ##PAUSE REASONS OR AUXREASIONS
  d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
  begin
            mysql.query("truncate auxreasonsbkp")
           @prs=PauseReason.find(:all)
          @prs.each do |s|
          id=s.id
          reasons=s.PR_PauseReasonDesc
          downloadeddate=Date.today

          
          mysql.query("insert into auxreasonsbkp(id,reasons,downloadeddate) values(#{id} ,\"#{reasons}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="auxreasonsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=STPReason.find_by_sql("Select count(*) as counter from pause_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from auxreasonsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="auxreasonsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from pause_reasons")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from auxreasonsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ##PAUSE REASONS OR AUXREASIONS ENDS
  elsif b=="adsbkp"
    ###ADS STARTS
    d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
  begin
             mysql.query("truncate adsbkp")
          @prs=TokenBottomAd.find(:all)
          @prs.each do |s|
          #id=s.id
          adtext=s.BOT_AdMessage
          downloadeddate=Date.today
               
          mysql.query("insert into adsbkp(adtext,downloadeddate) values(\"#{adtext}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="adsbkp"
          @dataexp.EXP_FullExport="True"

     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=TokenBottomAd.find_by_sql("Select count(*) as counter from token_bottom_ads")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from adsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      
  rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="adsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from token_bottom_ads")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from adsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
  ## Display Token footer Ends
elsif b=="displayscrollmsgsbkp"
  ##Display scroll message started
  d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{a}' and EXP_Date='#{d}' and EXP_MasterName='#{b}'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end
   begin
          mysql.query("truncate displayscrollmsgsbkp")
          @prs=DisplayScrollMessage.find(:all)
          @prs.each do |s|
          #id=s.id
          scrollmsg=s.SCRL_DisplayScrollMessage
          downloadeddate=Date.today
          
          mysql.query("insert into displayscrollmsgsbkp(scrollmsg,downloadeddate) values(\"#{scrollmsg}\",'#{downloadeddate}')")
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
     
   end
   for j in @f
   @g=j.CLST_RegionID

 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='Y'
          @dataexp.EXP_ErrorDescription=""
          @dataexp.EXP_MasterName="displayscrollmsgsbkp"
          @dataexp.EXP_FullExport="True"
         
     @dataexp.EXP_MachineStatus="Machine Connected"
   
          noofcount=TokenBottomAd.find_by_sql("Select count(*) as counter from display_scroll_messages")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from displayscrollmsgsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
      rescue Exception => exc
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=a
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{a}'")
     for i in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{i.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataexp.EXP_RegionID=@g
          @dataexp.EXP_Date=Date.today
          @dataexp.EXP_ExportCompleted='N'
          @dataexp.EXP_ErrorDescription=exc.message
          @dataexp.EXP_MasterName="displayscrollmsgsbkp"
          @dataexp.EXP_FullExport="False"
        commd="ping #{@ipadd}"
    y=system(commd)
    if y==true
     @dataexp.EXP_MachineStatus="Machine Connected"
    else
    @dataexp.EXP_MachineStatus="Machine Not Connected"
     end
          noofcount=STPReason.find_by_sql("Select count(*) as counter from display_scroll_messages")
                for ct in noofcount
                    no=ct.counter
                end
          @dataexp.EXP_NoOfRecordsSent=no
          result=mysql.query("select * from displayscrollmsgsbkp ")
          counter=0
                result.each do |c|
                    counter=counter+1
                end
          @dataexp.EXP_NoOfRecordsConfirmed=counter
          @dataexp.save
  end
 
  
  ##Display scroll message ended
    end#####Main If Ends Here

  
   
  rescue Exception => exe1

end##Main Exception Ends
 end##Main For Ends
  render :update do |page|

page.redirect_to url_for(:controller=>'datatransact', :action=>'exportfailure')
end
end
 
  

      
def showimpstatus

  #@radio1=params[:radio1]
@impstatus=params[:impstatus]
   
  @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
  
 
  


if params[:radio1]!=nil
  session[:all]="true"
  if params[:radio1]=="1"
    
      session[:allloc]="true"
    
      session[:loc]=nil
      session[:reg]=nil
      elsif params[:radio1]=="2"
       
        session[:reg]="true"
        
        session[:allloc]=nil
        session[:loc]=nil
        
        else
         
          session[:loc]="true"
          
          session[:allloc]=nil
          session[:reg]=nil
  end
else
   session[:allloc]=nil
   session[:reg]=nil
   session[:loc]=nil
 end
 
  if @start_date!=nil
    session[:impdate]=@start_date
    else
      session[:impdate]=nil
    end
    
    if @impstatus!=nil
      session[:impstat]=@impstatus
      else
        session[:impstat]=nil
        end
    
  render :update do |page|
    page << "document.getElementById('sub1').disabled=false;"
            page.replace_html 'impstat', :partial => 'impstat'
        end
end

def selectedimport

 
  
 
  a=params[:DataImportStatus][:id].to_a
  len=a.length
  require 'mysql'
  mysql = Mysql.init()
  
  for i in 0..(len-1) do
    begin
   @loc=DataImportStatus.find_by_sql("select IMP_LocationID from data_import_statuses where id=#{a[i]}")
      for item in @loc
          
          @loc1=Location.find_by_sql("select LOC_DQM_IPAddress from locations where LOC_SoleID='#{item.IMP_LocationID}'")
          @id=item.IMP_LocationID
          for j in @loc1
          @ipadd=j.LOC_DQM_IPAddress
          end
      end
       mysql.connect(@ipadd,'stlqms4icici','stlqms4icici')
      mysql.select_db('DQMS_development')
      results = mysql.query("SELECT * from transactmaster where exported='FALSE'")
      
      results.each do |item|
      @token=Token.new
      @token.LocationID=@id
      @token.DQM_IPAddress=@ipadd
      @token.SerialNo=item[0]
      @token.tokenno=item[1]
      @token.tokenid=item[2]
      @token.ctypeid=item[3]
      @token.transdate=item[4]
       @token.generatedtime=item[5]
        @token.serviceid=item[6]
        @token.counterno=item[7]
        @token.accountno=item[8]
        @token.login=item[9]
        @token.calledtime=item[10]
        @token.servicedtime=item[11]
        @token.timetaken=item[12]
        @token.waittime=item[13]
        @token.stpname=item[14]
        @token.nonstpname=item[15]
        @token.tokenstatus=item[16]
        @token.pauseflag=item[17]
        @token.pausetime=item[18]
        @token.releasetime=item[19]
        @token.bulkcount=item[20]
        @token.call1=item[21]
        @token.reasons=item[22]
        @token.missingflag=item[23]
        @token.pullcounter=item[24]
        @token.redirecttime=item[25]
        @token.save
        mysql.query("update transactmaster set exported='TRUE' where id=#{item[0]}")
      end
       @dataimp=DataImportStatus.find(a[i])
       @dataimp.IMP_LocationID=@id
       @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{@id}'")
     for b in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{b.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataimp.IMP_RegionID=@g
      @dataimp.IMP_Date=Date.today
     @dataimp.IMP_ImportCompleted='Y'
     @dataimp.IMP_ErrorDescription=""
   
     @dataimp.IMP_MachineStatus="Machine Connected"
    
     @dataimp.save
    
    rescue Exception => exc
       @dataimp=DataImportStatus.find(a[i])
       @dataimp.IMP_LocationID=@id
       @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{@id}'")
     for b in @e
     @f=Cluster.find_by_sql("select CLST_RegionID from clusters where id=#{b.LOC_ClusterID}")
   end
   for j in @f
   @g=j.CLST_RegionID
 end
 
      @dataimp.IMP_RegionID=@g
      @dataimp.IMP_Date=Date.today
     @dataimp.IMP_ImportCompleted='N'
     @dataimp.IMP_ErrorDescription=exc.message
             commd="ping #{@ipadd}"
     y=system(commd)
     if y==true
     @dataimp.IMP_MachineStatus="Machine Connected"
     else
       @dataimp.IMP_MachineStatus="Machine Not Connected"
       end
     @dataimp.save
    end
  end
  render :update do |page|

page.redirect_to url_for(:controller=>'datatransact', :action=>'importfailure')
end

end

def showr
  
  session[:msgR]="true"
  @regions=Region.find(:all)
  @locations=Location.find(:all)
     render :update do |page|
            page.replace_html 'regions', :partial => 'reg', :object => @regions
            page.replace_html 'loc', :partial => 'locations', :object => @locations
        end
  end
    def showl
  
  session[:msgL]="true"
  @regions=Region.find(:all)
  @locations=Location.find(:all)
     render :update do |page|
            page.replace_html 'regions', :partial => 'reg', :object => @regions
            page.replace_html 'loc', :partial => 'locations', :object => @locations
        end
  end
     def update_locations
    # updates Region based on Zone selected

    session[:regionid]=params[:id]
    
  end
   def showall
     @regions=Region.find(:all)
  @locations=Location.find(:all)
     render :update do |page|
            page.replace_html 'regions', :partial => 'reg', :object => @regions
            page.replace_html 'loc', :partial => 'locations', :object => @locations
        end
     end
   def update_loc
     
     session[:locid]=params[:id]
     
     
   end
   
  def updateservicetobranchimport
        @zones  = Zone.find(:all)
    @regions = Region.find(:all)
    @clusters= Cluster.find(:all)
    session[:uimp]="true"
    session[:data]=nil
       #render :update do |page|
       #      page.replace_html('import_div',:partial=>'import')
              #page.replace_html('imp_button',:partial=>'buttons')
          # end 
    end
  def updateservicetobranchexport
           @zones  = Zone.find(:all)
    @regions = Region.find(:all)
    @clusters= Cluster.find(:all)
    session[:uimp]="true"
    session[:data]=nil
    end
end
