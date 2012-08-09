class ReportsController < ApplicationController
 layout  'sidenew'

    require 'csv'
require 'fastercsv'

def redir

    redirect_to :action => 'master'
  end
  
  def update_clusters
         # updates Region based on Zone selected
   
    session[:region_id]=params[:id]
    cluster = Cluster.find_by_sql("select id, CLST_ClusterName from clusters where CLST_RegionID = #{params[:id]}")
  
    
     
       
         render :update do |page|
            page.replace_html 'clusters', :partial => 'clusters', :object => cluster
        end
   
      
    
  end
   def update_regions
    # updates Region based on Zone selected
    
    session[:zone_id]=params[:id]
    region = Region.find_by_sql("select id, REG_RegionName from regions where REG_ZoneID = #{params[:id]}")
    


    
     
          
         render :update do |page|
            page.replace_html 'regions', :partial => 'regions', :object => region
            
       
            
    end
  end
  
     def update_locations
    # updates Region based on Zone selected

    session[:cs_id]=params[:id]
    
    location = Location.find_by_sql("select id, LOC_BranchName from locations where LOC_ClusterID = #{params[:id]}")
    
  

    
     
          
         render :update do |page|
            page.replace_html 'locations', :partial => 'locations', :object => location
       
            
    end
  end

 #########Master Report Started
def master_report
    begin
            @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
            @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
            
            del_files 
            if params[:location][:id]!="" and (@start_date<=@end_date)
                    @lid=params[:location][:id]
                    @z=Zone.find(session[:zone_id])
                    z_name=@z.ZONE_ZoneName
                    session[:zone_id]=nil
                    @r=Region.find(session[:region_id])
                    r_name=@r.REG_RegionName
                    session[:region_id]=nil
                    @c=Cluster.find(session[:cs_id])
                    c_name=@c.CLST_ClusterName
                    session[:cs_id]=nil
                    
                    lt=Location.find_by_sql("select LOC_SoleID,LOC_BranchName from locations where id='#{@lid}'")
                    
                    for m in lt
                    #puts m.LOC_SoleID
                    #puts m.LOC_BranchName
                    end
                    #puts lt
                    #puts "BYYYYY"
                    for n in lt
                       @nlid=n.LOC_SoleID
                       @bname=n.LOC_BranchName
                    end
                    da=Date.today
                    count=0
                    sid=Token.find_by_sql("select distinct serviceid,tokenno,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname from tokens 
                                  where (tokenstatus=0 or tokenstatus=1 or tokenstatus=3 )
                                  and transdate between '#{@start_date}' and '#{@end_date}'and LocationID='#{@nlid}'
                                  group by tokenno,serviceid,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname
                                  order by tokenno
                                 ")
                   
                      ct=-1
                      for q in sid
                           ct=ct+1
                     end
                     if ct<0
                            session[:msg]="No data for selected values"
                            redirect_to :action => 'master'
                     else    
                       
                          gen_file_master(da,sid,@bname,z_name,r_name,c_name,@start_date,@end_date)
                       
                          
                          pw=Dir.pwd()
                         
                         
                          Dir.chdir(pw)
                          filename=pw.to_s+"/"+"Master_report"+".csv"
                          open_file(filename)
                          session[:msg]="Report Generated Succefully"
                     end
          elsif params[:location][:id]=="" and (@start_date<=@end_date)
                    
                    lt=Location.find_by_sql("select LOC_SoleID,LOC_BranchName from locations")
                    
                    
                    for m in lt
                    #puts m.LOC_SoleID
                    #puts m.LOC_BranchName
                    
                   # puts lt
                    
                          for n in lt
                                @nlid=n.LOC_SoleID
                                @bname=n.LOC_BranchName
                          end
                    da=Date.today
                    sid=Token.find_by_sql("select distinct serviceid,tokenno,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname from tokens 
                                  where (tokenstatus=0 or tokenstatus=1 or tokenstatus=3 )
                                  and transdate between '#{@start_date}' and '#{@end_date}'
                                  group by tokenno,serviceid,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname
                                  order by tokenno
                                 ")
                    
                 
                     
                    ct=-1
                        for q in sid
                            ct=ct+1
                          end
                            end
                        if ct<0
                            session[:msg]="No data for selected values"
                            redirect_to :action => 'master'
                        else    
                            gen_file_master(da,sid,"All","All","All","All",@start_date,@end_date)
                            pw=Dir.pwd()
                        
                            Dir.chdir(pw)
                            filename=pw.to_s+"/"+"Master_report"+".csv"
                            open_file(filename)
                            session[:msg]="Report Generated Succefully"
                         end           
            else
                        
                        session[:msg]="Please select a proper data"
                        redirect_to :action => 'master'
            end
  rescue Exception=>exc
       
        redirect_to :action => "master"
  end
   
end

def gen_file_master(fir,sec,bname,z,r,c,s_date,e_date)
  #begin
  one="Master_report"+".csv" 
  
  @header= ['Tokenno','Transaction Date','Generated Time','Called Time','Sec/Called Time','Serviced Time','Service Name','Counter No.','Teller Name','Wait Time','Time Taken','Total Time','STP Name','NonSTP Name','Token Status']
  if File.exists?(one)
    fp=File.open("Master_report"+".csv","a")   
     for item in sec
     d=item.serviceid

     @sname=Service.find_by_sql("select SVC_ServiceName from services where SVC_ServiceID='#{d}'")
     for sname in @sname
     st=sname.SVC_ServiceName
    
  end
  @ctno=Token.find_by_sql("Select counterno from tokens where tokenno='#{item.tokenno}'")
  for j in @ctno
  d=j.counterno
end

     if item.tokenstatus==1
secfortimetaken=(item.timetaken.to_s[0,2]).to_i*3600+(item.timetaken.to_s[3,2]).to_i*60+(item.timetaken.to_s[6,2]).to_i

secforwaittime=(item.waittime.to_s[0,2]).to_i*3600+(item.waittime.to_s[3,2].to_s).to_i*60+(item.waittime.to_s[6,2].to_s).to_i



tomili=(secfortimetaken.to_i)*1000+(secforwaittime.to_i)*1000

tosec=(((tomili % (1000*60*60)) % (1000*60)) / 1000)
    tomin=(tomili % (1000*60*60)) / (1000*60)
    tohrs = (tomili / (1000*60*60))
    #puts tosec
    #puts tomin
    #puts tohrs
    if tohrs<=9
      tohrs="0"+tohrs.to_s
    end
    if tomin<=9
      tomin="0"+tomin.to_s
    end
    if tosec<=9
      tosec="0"+tosec.to_s
    end
    totaltime=(tohrs.to_s+":"+tomin.to_s+":"+tosec.to_s).to_s
        @r=[item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,item.servicedtime,st1,d,item.login,item.waittime,item.timetaken,totaltime,item.stpname,item.nonstpname,"Served"]
         csv << @r
         elsif item.tokenstatus==3
            @r=[item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,'' ,st1,d,item.login,item.waittime,item.timetaken,item.waittime,item.stpname,item.nonstpname,"Missed"]
         csv << @r
         else
             @r=[item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,'','','',st1,d,'','','','',item.stpname,item.nonstpname,"Not Served"]
         csv << @r
           end
       
    end
       fp.close
  else
    
          fp=File.open("Master_report"+".csv","w") 
      
      
      FasterCSV.open(one, "w") do |csv|
        csv << "Master Report"
        csv << "Zone Name:-"+z
        csv << "Region Name:-"+r
        csv << "Cluster Name:-"+c
        csv << "Branch Name:-"+bname
        csv << "Date Generated"+" "+(Date.today.strftime("%d-%m-%y")).to_s
        csv << "Date Generated from"+" "+s_date.strftime("%d-%m-%y").to_s+" "+"To"+" "+e_date.strftime("%d-%m-%y").to_s
        csv << " "
        csv << " "
        #csv << @a
        csv<<@header
      end  
      for item in sec
      d=item.serviceid

     @sname=Service.find_by_sql("select SVC_ServiceName from services where SVC_ServiceID='#{d}'")
     for sname in @sname
     st1=sname.SVC_ServiceName

     end
     @ctno=Token.find_by_sql("Select counterno from tokens where tokenno='#{item.tokenno}'")
  for j in @ctno
  d=j.counterno
end

      FasterCSV.open(one, "a") do |csv|
            if item.tokenstatus==1

secfortimetaken=(item.timetaken.to_s[0,2]).to_i*3600+(item.timetaken.to_s[3,2]).to_i*60+(item.timetaken.to_s[6,2]).to_i

secforwaittime=(item.waittime.to_s[0,2]).to_i*3600+(item.waittime.to_s[3,2].to_s).to_i*60+(item.waittime.to_s[6,2].to_s).to_i



tomili=(secfortimetaken.to_i)*1000+(secforwaittime.to_i)*1000

tosec=(((tomili % (1000*60*60)) % (1000*60)) / 1000)
    tomin=(tomili % (1000*60*60)) / (1000*60)
    tohrs = (tomili / (1000*60*60))
    #puts tosec
    #puts tomin
    #puts tohrs
    if tohrs<=9
      tohrs="0"+tohrs.to_s
    end
    if tomin<=9
      tomin="0"+tomin.to_s
    end
    if tosec<=9
      tosec="0"+tosec.to_s
    end
    totaltime=(tohrs.to_s+":"+tomin.to_s+":"+tosec.to_s).to_s

        @r=[item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,item.servicedtime,st1,d,item.login,item.waittime,item.timetaken,totaltime,item.stpname,item.nonstpname,"Served"]
         csv << @r
         elsif item.tokenstatus==3
            @r=[item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,'' ,st1,d,item.login,item.waittime,item.timetaken,item.waittime,item.stpname,item.nonstpname,"Missed"]
         csv << @r
         else
             @r=[item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,'','','',st1,d,'','','','',item.stpname,item.nonstpname,"Not Served"]
         csv << @r
           end
      end
       
    end
    fp.close
  end
  

#rescue
  #        redirect_to :action => "master"
#end
    
 end
 ############Master Report Ended
 #Common Code used for All Report
 
 def open_file(filename)

  #send_file filename, :x_sendfile => true, :type => 'xls'
 send_file(filename,
      :disposition => 'attachment',
      :encoding => 'utf8',
      :type => 'application/octet-stream')
      
end
 
  def del_files   
    pw=Dir.pwd()

      Dir.chdir(pw)
   
  xlsfiles = Dir.entries(".").select {|x| /\.csv\z/ =~ x}

  for del in xlsfiles

  File.delete(del)
end

   end
   
   
   end

