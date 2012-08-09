class ReportsController < ApplicationController
  require "excel"
  include Spreadsheet

layout 'sidenew'
#require "spreadsheet/excel"
#include Spreadsheet
########## NEW ICICI Report Fromats #########################   
def dateselection
end

def masterpage
end

def allreportcode
begin
     @report_type=params[:reportid]
     @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
     @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
     @todays_date=Time.now()
     @soleid=params[:soleid]
     @tody_date=@todays_date.strftime("%Y-%m-%d")
     @curr_day=Date.parse(@tody_date)
     if @start_date==@curr_day or @end_date==@curr_day
         @msg="Today's data is not available        "
         render :action => "dateselection"
     else
      if @start_date <= @end_date
          if @end_date <= @curr_day
                                  #################################### Average wait Time ######################################
                                   if @report_type=="awt"
                                        csv_string = FasterCSV.generate do |csv| 
                                        ######################################### header row #################################################
                                        csv << ["DAY", "MONTH", "UNIVERS_NAME","TOKEN_TYPE","SUM_OF_Service_Time","SUM_OF_Wait_Time","COUNT_OF_TOKEN_TYPE","Servicetime_Average","Waittime_Average"] 
                                        ############################################## data rows #####################################################
                                        @transact_transdate=Transact.find_by_sql("select distinct transdate from transacts where transdate between '#{@start_date}' and '#{@end_date}' ORDER BY transdate")
                                        @transact_transdate.each do |tdate|
                                                        @a=tdate.transdate
                                                        @trans_dt=@a.strftime("%Y/%m/%d")
                                                        #@transact_soleid=Transact.find_by_sql("select distinct soleid from transacts where transdate='#{@trans_dt}'")
                                                        #@transact_soleid.each do |tsoleid|
                                                                               @branch=Location.find_by_sql("select LOC_BranchName from locations where LOC_SoleID='#{@soleid}'")
                                                                               @branch.each do |bname|
                                                                                            @branch_name=bname.LOC_BranchName
                                                                                            (1..3).each do |i|
                                                                                                  if i==1
                                                                                                       @ctype_abbr="G"
                                                                                                  else 
                                                                                                       if i==2
                                                                                                           @ctype_abbr="C"
                                                                                                       else
                                                                                                           @ctype_abbr="N"
                                                                                                       end
                                                                                                  end
                                                                                                 @trans_day=tdate.transdate.strftime("%d")
                                                                                                 @trans_month=tdate.transdate.strftime("%m")
                                                                                                 #################### Logic for sum of service  time #######################
                                                                                                 @service_time=Transact.find_by_sql("SELECT SUM(DATEPART(ss, timetaken))as second,
                                                                                             SUM(DATEPART(hh, timetaken))*60*60 as hour,
                                                                                             SUM(DATEPART(mi, timetaken))*60 as minute
                                                                                             FROM transacts
                                                                                             where tokenstatus=1 and ctypeid='#{i}'
                                                                                             and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 @seconds_all=@service_time[0].hour.to_i + @service_time[0].second.to_i + @service_time[0].minute.to_i
                                                                                                 seconds=@seconds_all % 60
                                                                                                 @seconds_all = @seconds_all/60
                                                                                                 minutes=  @seconds_all % 60
								                                                                                 hours =  @seconds_all/ 60
								                                                                                 if(hours<10)
                                                                                                    hours="0#{hours}"
								                                                                                 end
                                                                                                 if(minutes<10)
                                                                                                    minutes="0#{minutes}"
                                                                                                 end
                                                                                                 if(seconds<10)
                                                                                                    seconds="0#{seconds}"
                                                                                                 end 
								                                                                                @sum_of_service_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                puts @sum_of_service_time
                                                                                                ######################## logic for sum of wait time #######################
                                                                                                @wait_time=Transact.find_by_sql("SELECT SUM(DATEPART(ss, waittime))as second,
                                                                                          SUM(DATEPART(hh, waittime))*60*60 as hour,
                                                                                          SUM(DATEPART(mi, waittime))*60 as minute
                                                                                          FROM transacts
                                                                                          where tokenstatus=1 and ctypeid='#{i}'
										                                                                             and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                @seconds_all=@wait_time[0].hour.to_i + @wait_time[0].second.to_i + @wait_time[0].minute.to_i
                                                                                                seconds=@seconds_all % 60
								                                                                                @seconds_all = @seconds_all/60
                                                                                                minutes=  @seconds_all % 60
								                                                                                hours =  @seconds_all/ 60
                                                                                                if(hours<10)
                                                                                                   hours="0#{hours}"
								                                                                                end
                                                                                                if(minutes<10)
                                                                                                   minutes="0#{minutes}"
                                                                                                end
                                                                                                if(seconds<10)
                                                                                                   seconds="0#{seconds}"
                                                                                                end 
                                                                                                puts "22222222222222222222222222222222222222222222222"
                                                                                                @sum_of_wait_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                 puts @sum_of_wait_time
                                                                                                 ###################### Logic for count out token of that type #####################
                                                                                                 @token_count=Transact.find_by_sql("SELECT count(tokenno)as count_token
                                                                                                                                    FROM transacts
                                                                                                                                     where tokenstatus=1 and ctypeid='#{i}'
                                                                                                                                    and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 puts "3333333333333333333333333333333333333333333333"
                                                                                                 puts @tcount=@token_count[0].count_token.to_i
                                                                                                 ######################## Logic for average service time ##########################
                                                                                                 @service_time_avg=Transact.find_by_sql("SELECT avg(DATEPART(ss, timetaken))as second,
                                                                                                 avg(DATEPART(hh, timetaken))*60*60 as hour,
                                                                                                 avg(DATEPART(mi, timetaken))*60 as minute
                                                                                                 FROM transacts
                                                                                                 where tokenstatus=1 and ctypeid='#{i}'
                                                                                                 and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 @seconds_all=@service_time_avg[0].hour.to_i + @service_time_avg[0].second.to_i + @service_time_avg[0].minute.to_i
                                                                                                 seconds=@seconds_all % 60
                                                                                                 @seconds_all = @seconds_all/60
								                                                                                 minutes=  @seconds_all % 60
								                                                                                 hours =  @seconds_all/ 60
                                                                                                 if(hours<10)
                                                                                                    hours="0#{hours}"
								                                                                                 end
                                                                                                 if(minutes<10)
                                                                                                    minutes="0#{minutes}"
                                                                                                 end
                                                                                                 if(seconds<10)
                                                                                                    seconds="0#{seconds}"
                                                                                                 end 
                                                                                                 puts "444444444444444444444444444444444444444444444"
								                                                                                 @avg_of_service_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                 puts @avg_of_service_time
                                                                                                 ########################## Logic for average wait time ############################
                                                                                                 @wait_time_avg=Transact.find_by_sql("SELECT avg(DATEPART(ss, waittime))as second,
                                                                                               avg(DATEPART(hh, waittime))*60*60 as hour,
                                                                                               avg(DATEPART(mi, waittime))*60 as minute
                                                                                               FROM transacts
                                                                                               where tokenstatus=1 and ctypeid='#{i}'
                                                                                               and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 @seconds_all=@wait_time_avg[0].hour.to_i + @wait_time_avg[0].second.to_i + @wait_time_avg[0].minute.to_i
                                                                                                 seconds=@seconds_all % 60
								                                                                                 @seconds_all = @seconds_all/60
                                                                                                 minutes=  @seconds_all % 60
								                                                                                 hours =  @seconds_all/ 60
                                                                                                 if(hours<10)
                                                                                                    hours="0#{hours}"
								                                                                                 end
                                                                                                 if(minutes<10)
                                                                                                    minutes="0#{minutes}"
                                                                                                 end
                                                                                                 if(seconds<10)
                                                                                                    seconds="0#{seconds}"
                                                                                                end 
                                                                                                puts "55555555555555555555555555555555555555555555555555555"
								                                                                                @avg_of_wait_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                puts @avg_of_wait_time
                                                                                                csv << [@trans_day, @trans_month, @branch_name,@ctype_abbr,@sum_of_service_time,@sum_of_wait_time,@tcount,@avg_of_service_time,@avg_of_wait_time] 
                                                                                           end#for ctype
                                                                              end#for branch name
                                                     #end#fro soleid
                                          end # for transdate
################################################################################################
                                          end #csv end
                                             send_data csv_string, 
                                                       :type => 'text/csv; charset=iso-8859-1; header=present', 
                                                       :disposition => "attachment; filename=Average_wait_time_'#{@soleid}'.csv" 
                               end# if of awt
                               ######################### Branch employee wise token pulled ###############################                      
                               if @report_type=="bewtp"
                                        csv_string = FasterCSV.generate do |csv| 
                                        ######################################### header row #################################################
                                        csv << ["DAY", "MONTH", "UNIVERS_NAME","USER_NAME","TOKEN_TYPE","SUM_OF_Service_Time","SUM_OF_Wait_Time","COUNT_OF_TOKEN_TYPE","Servicetime_Average","Waittime_Average"] 
                                        ############################################## data rows #####################################################
                                        @transact_transdate=Transact.find_by_sql("select distinct transdate from transacts where transdate between '#{@start_date}' and '#{@end_date}' ORDER BY transdate")
                                        @transact_transdate.each do |tdate|
                                                        @a=tdate.transdate
                                                        @trans_dt=@a.strftime("%Y/%m/%d")
                                                        #@transact_soleid=Transact.find_by_sql("select distinct soleid from transacts where transdate='#{@trans_dt}'")
                                                        #@transact_soleid.each do |tsoleid|
                                                                               @branch=Location.find_by_sql("select LOC_BranchName from locations where LOC_SoleID='#{@soleid}'")
                                                                               @branch.each do |bname|
                                                                                          @branch_name=bname.LOC_BranchName
                                                                                          @user=Transact.find_by_sql("select distinct login from transacts where soleid='#{@soleid}'")
                                                                                          @user.each do |uname|
                                                                                            @login=uname.login
                                                                                            (1..3).each do |i|
                                                                                                  if i==1
                                                                                                       @ctype_abbr="G"
                                                                                                  else 
                                                                                                       if i==2
                                                                                                           @ctype_abbr="C"
                                                                                                       else
                                                                                                           @ctype_abbr="N"
                                                                                                       end
                                                                                                  end
                                                                                                 @trans_day=tdate.transdate.strftime("%d")
                                                                                                 @trans_month=tdate.transdate.strftime("%m")
                                                                                                 #################### Logic for sum of service  time #######################
                                                                                                 @service_time=Transact.find_by_sql("SELECT SUM(DATEPART(ss, timetaken))as second,
                                                                                             SUM(DATEPART(hh, timetaken))*60*60 as hour,
                                                                                             SUM(DATEPART(mi, timetaken))*60 as minute
                                                                                             FROM transacts
                                                                                             where tokenstatus=1 and ctypeid='#{i}'
                                                                                             and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 @seconds_all=@service_time[0].hour.to_i + @service_time[0].second.to_i + @service_time[0].minute.to_i
                                                                                                 seconds=@seconds_all % 60
                                                                                                 @seconds_all = @seconds_all/60
                                                                                                 minutes=  @seconds_all % 60
								                                                                                 hours =  @seconds_all/ 60
								                                                                                 if(hours<10)
                                                                                                    hours="0#{hours}"
								                                                                                 end
                                                                                                 if(minutes<10)
                                                                                                    minutes="0#{minutes}"
                                                                                                 end
                                                                                                 if(seconds<10)
                                                                                                    seconds="0#{seconds}"
                                                                                                 end 
								                                                                                @sum_of_service_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                puts @sum_of_service_time
                                                                                                ######################## logic for sum of wait time #######################
                                                                                                @wait_time=Transact.find_by_sql("SELECT SUM(DATEPART(ss, waittime))as second,
                                                                                          SUM(DATEPART(hh, waittime))*60*60 as hour,
                                                                                          SUM(DATEPART(mi, waittime))*60 as minute
                                                                                          FROM transacts
                                                                                          where tokenstatus=1 and ctypeid='#{i}'
										                                                                             and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                @seconds_all=@wait_time[0].hour.to_i + @wait_time[0].second.to_i + @wait_time[0].minute.to_i
                                                                                                seconds=@seconds_all % 60
								                                                                                @seconds_all = @seconds_all/60
                                                                                                minutes=  @seconds_all % 60
								                                                                                hours =  @seconds_all/ 60
                                                                                                if(hours<10)
                                                                                                   hours="0#{hours}"
								                                                                                end
                                                                                                if(minutes<10)
                                                                                                   minutes="0#{minutes}"
                                                                                                end
                                                                                                if(seconds<10)
                                                                                                   seconds="0#{seconds}"
                                                                                                end 
                                                                                                puts "22222222222222222222222222222222222222222222222"
                                                                                                @sum_of_wait_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                 puts @sum_of_wait_time
                                                                                                 ###################### Logic for count out token of that type #####################
                                                                                                 @token_count=Transact.find_by_sql("SELECT count(tokenno)as count_token
                                                                                                                                       FROM transacts
                                                                                                                                       where tokenstatus=1 and ctypeid='#{i}'
                                                                                                                              and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 puts "3333333333333333333333333333333333333333333333"
                                                                                                 puts @tcount=@token_count[0].count_token.to_i
                                                                                                 ######################## Logic for average service time ##########################
                                                                                                 @service_time_avg=Transact.find_by_sql("SELECT avg(DATEPART(ss, timetaken))as second,
                                                                                                 avg(DATEPART(hh, timetaken))*60*60 as hour,
                                                                                                 avg(DATEPART(mi, timetaken))*60 as minute
                                                                                                 FROM transacts
                                                                                                 where tokenstatus=1 and ctypeid='#{i}'
                                                                                                 and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 @seconds_all=@service_time_avg[0].hour.to_i + @service_time_avg[0].second.to_i + @service_time_avg[0].minute.to_i
                                                                                                 seconds=@seconds_all % 60
                                                                                                 @seconds_all = @seconds_all/60
								                                                                                 minutes=  @seconds_all % 60
								                                                                                 hours =  @seconds_all/ 60
                                                                                                 if(hours<10)
                                                                                                    hours="0#{hours}"
								                                                                                 end
                                                                                                 if(minutes<10)
                                                                                                    minutes="0#{minutes}"
                                                                                                 end
                                                                                                 if(seconds<10)
                                                                                                    seconds="0#{seconds}"
                                                                                                 end 
                                                                                                 puts "444444444444444444444444444444444444444444444"
								                                                                                 @avg_of_service_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                 puts @avg_of_service_time
                                                                                                 ########################## Logic for average wait time ############################
                                                                                                 @wait_time_avg=Transact.find_by_sql("SELECT avg(DATEPART(ss, waittime))as second,
                                                                                               avg(DATEPART(hh, waittime))*60*60 as hour,
                                                                                               avg(DATEPART(mi, waittime))*60 as minute
                                                                                               FROM transacts
                                                                                               where tokenstatus=1 and ctypeid='#{i}'
                                                                                               and transdate='#{@trans_dt}' and soleid='#{@soleid}'") 
                                                                                                 @seconds_all=@wait_time_avg[0].hour.to_i + @wait_time_avg[0].second.to_i + @wait_time_avg[0].minute.to_i
                                                                                                 seconds=@seconds_all % 60
								                                                                                 @seconds_all = @seconds_all/60
                                                                                                 minutes=  @seconds_all % 60
								                                                                                 hours =  @seconds_all/ 60
                                                                                                 if(hours<10)
                                                                                                    hours="0#{hours}"
								                                                                                 end
                                                                                                 if(minutes<10)
                                                                                                    minutes="0#{minutes}"
                                                                                                 end
                                                                                                 if(seconds<10)
                                                                                                    seconds="0#{seconds}"
                                                                                                end 
                                                                                                puts "55555555555555555555555555555555555555555555555555555"
								                                                                                @avg_of_wait_time="#{hours}:#{minutes}:#{seconds}"  
                                                                                                puts @avg_of_wait_time
                                                                                                csv << [@trans_day, @trans_month, @branch_name,@login,@ctype_abbr,@sum_of_service_time,@sum_of_wait_time,@tcount,@avg_of_service_time,@avg_of_wait_time] 
                                                                                              end#for ctype
                                                                                          end#for username
                                                                              end#for branch name
                                                     #end#fro soleid
                                          end # for transdate
                            ################################################################################################
                                          end #csv end
                                             send_data csv_string, 
                                                       :type => 'text/csv; charset=iso-8859-1; header=present', 
                                                       :disposition => "attachment; filename=Branch_Employee_Wise_Token_Pulled_'#{@soleid}'.csv" 
                            end# if of bewtp
                            #################################### Detailed Master Report ######################################
                                   if @report_type=="cmttransact"
                                        csv_string = FasterCSV.generate do |csv| 
                                            ######################################### header row ################################################# 
                                        csv << ["TransDate","Sole ID","Token No","Generated Time","Teller Name","Called Time","Counter No","Wait Time","Service ID","Serviced Name","Timetaken","Tokenstatus"] 
                                           ############################################## data rows #####################################################
                                           @master=Transact.find_by_sql("select distinct serviceid,tokenno,transdate,generatedtime,login,calledtime,counterno,waittime,serviceid,soleid,timetaken,tokenstatus
						                                                 from transacts
						                                                 where transdate between '#{@start_date}' and '#{@end_date}'
    						                                               and (tokenstatus=0 or tokenstatus=1 or tokenstatus=3 ) and soleid='#{@soleid}' order by generatedtime") 
                                           @master.each do |element|
                                                         @serviceid=element.serviceid
                                                         @tokenno=element.tokenno
                                                         @soleid=element.soleid
                                                         @transdate=element.transdate.strftime("%d/%m/%Y")
                                                         @generatedtime=element.generatedtime.strftime("%H:%M:%S") 
                                                         @login=element.login
                                                         @calledtime=element.calledtime.strftime("%H:%M:%S")
                                                         @counterno=element.counterno
                                                         @waittime=element.waittime.strftime("%H:%M:%S")
                                                         @serviced=element.serviceid
                                                         @a=Service.find(:first,:select=>"SVC_ServiceName",:conditions=>["SVC_ServiceID=?",@serviced]) 
                                                         @timetaken=element.timetaken.strftime("%H:%M:%S")
                                                         @tokenstatus=element.tokenstatus
                                              csv << [@transdate,@soleid,@tokenno,@generatedtime,@login,@calledtime,@counterno,@waittime,@serviceid,@a.SVC_ServiceName,@timetaken,@tokenstatus] 
                                           end# if of trans
                                        end #csv end
                                             send_data csv_string, 
                                                       :type => 'text/csv; charset=iso-8859-1; header=present', 
                                                       :disposition => "attachment; filename=Detail_Master_Report'#{@soleid}'.csv" 
                                    end# if of cmttransact                    
#****************************************************************************************************************************************
                                 if @report_type=='0'
                                      @msg="Report is under construction."
                                      render :action => "error"  
                                 end                           
      else
          @msg="Please select proper end date."
                     render :action => "dateselection"     
      end#if of date validation 
    else
       @msg="Please select proper start date."
                 render :action => "dateselection"     
             end
             end
rescue ArgumentError
        @msg="Invalid date selection."
         render :action => "dateselection"  
end
end
##################  END #######################################
def redir

    redirect_to :action => 'master'
  end
  
  
  def masterreporth
         spreadsheet_file="Masterreport.xls"
         workbook=Excel.new(spreadsheet_file)
         worksheet=workbook.add_worksheet
         @count=0
          page_header_format=Format.new(:color=>'black', :bold=>true, :size=>14)
          player_name_format=Format.new(:color=>'black', :bold=>true,:size=>20)

          header_format=Format.new(:color=>'blue', :bold=>true,:size=>10)
          data_format=Format.new()
          workbook.add_format(page_header_format)
          workbook.add_format(player_name_format)
          workbook.add_format(header_format)
          workbook.add_format(data_format)
          worksheet.write(0, 3, 'Master Report', page_header_format)

          current_row=3
          header_row=2
          footer_row=0
          current_row=current_row+1
          @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
          @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
          
          if @start_date<@end_date             
               @count=0 
               @branch_name= params[:location][:LOC_SoleID]
               
               #@sole_id=Location.find(:select =>"LOC_SoleID",:conditions =>["LOC_BranchName=?","#{@branch_name}"])
               
               @master=Transact.find(:all, :conditions => ["transdate between ? and ? and soleid=?", @start_date, @end_date,@branch_name])
               header_row=footer_row+2
               header_row=header_row+2
               worksheet.write(header_row, 0, ['Sr.No','Token No','Transdate','Teller Name','Service Name','Generated Time','Called Time','Counter Number','Wait Time','Serviced Time','Timetaken'], header_format)
               current_row=header_row+2
            		 
   @master.each do |player|
       worksheet.write(current_row, 0, @count=@count+1)
       worksheet.write(current_row, 1, player.tokenno)     
       worksheet.write(current_row, 2, player.transdate.strftime("%d/%m/%Y"))  
       worksheet.write(current_row, 3, player.login) 
       worksheet.write(current_row, 4, player.serviceid) 
       worksheet.write(current_row, 5, player.generatedtime.strftime("%H:%M:%S")) 
    if (player.calledtime!=nil)
          worksheet.write(current_row, 6, player.calledtime.strftime("%H:%M:%S")) 
    end
         worksheet.write(current_row, 7, player.counterno)
    if player.waittime!=nil
         worksheet.write(current_row, 8, player.waittime.strftime("%H:%M:%S")) 
    end
    if player.serviced!=nil 
      worksheet.write(current_row, 9, player.serviced.strftime("%H:%M:%S"))
    end
    if player.timetaken!=nil
      worksheet.write(current_row, 10, player.timetaken.strftime("%H:%M:%S"))
    end

=begin
@status= player.tokenstatus 
    if ((@status=="0"))
      worksheet.write(current_row, 11, "InQueue")
    elsif(@status=="1")
      worksheet.write(current_row, 11, "Completed")
    elsif(@status=="3")
      worksheet.write(current_row, 11, "Missed")
    end
=end   
    current_row=current_row+1
    p current_row
  end
   footer_row=current_row
   
   
    worksheet.write(footer_row,6,@mean,header_format)
    
    footer_row=footer_row+1      
    
    workbook.close

pw=Dir.pwd()
        Dir.chdir(pw)
        filename=pw.to_s+"/"+spreadsheet_file
	   
    send_file(filename,
      :disposition => 'attachment',
      :encoding => 'utf8',
      :type => 'application/octet-stream')
       
  else
     @report_msg="Please Select Proper Date..."   
     render :action => "master"     
  end
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

   def master_report_visible
       render :update do |page|
           page << "document.getElementById('aux_div').style.visibility = 'hidden'"
       end
       
   end
 #########Master Report Started
 
 
def master
end

def openfile
     pw=Dir.pwd()
    Dir.chdir(pw)
    filename=pw.to_s+"/"+"Master_report"+".csv"
    send_file(filename,
      :disposition => 'attachment',
      :encoding => 'utf8',
      :type => 'application/octet-stream')
      #redirect_to :action=>'master'
      
end

#########################################################################
##### CODE FOR HIDING PROGRESS BAR AND DISPLAYING REPORT DIALGOG BOX#####
##### CREATED BY SUREKHA 03-02-2009 #####################################

def nodatamaster
    
    render :update do |page|
    #page.replace_html 'aux_div', '<font size=4 color=#08176C>No Data for Selected Values</font>'
    page.redirect_to url_for(:action=>'master')
    
    end                      
end

def properdatamaster
    
    render :update do |page|
    #page.replace_html 'aux_div', '<font size=4 color=#08176C>Start Date should be less than End Date</font>'
    page.redirect_to url_for(:action=>'master')
    
    end                      
end

def refreshmaster
    
    render :update do |page|
    page << "document.getElementById('aux_div').style.visibility = 'hidden'"
    page.redirect_to url_for(:action=>'openfile')
    
    end                      
end
############################ END ###########################################
############################################################################

def master_report
    begin
            
            @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
            @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
            
            
            del_files 
           
            if params[:location][:id]!="" and (@start_date<=@end_date)
                    
                    begin
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
                    rescue Exception=>exc
                    #redirect_to :action=>'master'
                    end
                    
                    lt=Location.find_by_sql("select LOC_SoleID,LOC_BranchName from locations where id='#{@lid}'")
                    
                    #for m in lt
                    #puts m.LOC_SoleID
                    #puts m.LOC_BranchName
                    #end
                    
                    
                    #puts lt
                    #puts "BYYYYY"
                    for n in lt
                       @nlid=n.LOC_SoleID
                       @bname=n.LOC_BranchName
                    end
                    da=Date.today
                    count=0
                    
                    #puts "in query"
                    sid=Token.find_by_sql("select distinct serviceid,tokenno,locationid,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname,tokenid from tokens 
                                  where (tokenstatus=0 or tokenstatus=1 or tokenstatus=3 )
                                  and transdate between '#{@start_date}' and '#{@end_date}'and LocationID='#{@nlid}'
                                  group by tokenno,serviceid,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname,locationid,tokenid
                                  order by locationid,transdate,tokenid
                                 ")
                   
                      ct=-1
                      for q in sid
                           ct=ct+1
                     end
                     if ct<0
                            #puts "no data"
                            session[:msg]="No data for selected values"
                           redirect_to :action => 'nodatamaster'
                     else    
                       
                          gen_file_master(da,sid,@bname,z_name,r_name,c_name,@start_date,@end_date)
                          #puts "report created"
                          pw=Dir.pwd()
                         
                         
                          Dir.chdir(pw)
                          filename=pw.to_s+"/"+"Master_report"+".csv"
                        
                          
                           redirect_to :action => 'refreshmaster'
                           #open_file(filename)
                        
                        #if(y!="value")
                             
                        #render :update do |page|
                        #page.replace_html 'aux_div', 'Please wait releasing pause ....'
                        #end
                    #end
                   
                    
                          #session[:msg]="Report Generated Succefully"
                     end
          elsif params[:location][:id]=="" and (@start_date<=@end_date)
                    
                    #lt=Location.find_by_sql("select distinct Locationid from tokens")
                    
                    
                    #for m in lt
                    #puts m.LOC_SoleID
                    #puts m.LOC_BranchName
                    
                   # puts lt
                    
                          #for n in lt
                                #@nlid=m.Locationid
                                #@bname=m.LOC_BranchName
                          #end
                    da=Date.today
                    sid=Token.find_by_sql("select distinct serviceid,locationid,tokenno,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname,tokenid from tokens 
                                  where (tokenstatus=0 or tokenstatus=1 or tokenstatus=3 )
                                  and transdate between '#{@start_date}' and '#{@end_date}'
                                  group by tokenno,serviceid,transdate,generatedtime,login,calledtime,call1,
                                  waittime,servicedtime,timetaken,tokenstatus,stpname,nonstpname,locationid,tokenid
                                  order by locationid,transdate,tokenid
                                 ")
                    
                 
                     
                    ct=-1
                        for q in sid
                            ct=ct+1
                          end
                            #end
                        if ct<0
                           
                            session[:msg]="No Records found for selected values"
                            redirect_to :action => 'nodatamaster'
                        else    
                            gen_file_master(da,sid,"All","All","All","All",@start_date,@end_date)
                            
                            #pw=Dir.pwd()
                        
                            #Dir.chdir(pw)
                            #filename=pw.to_s+"/"+"Master_report"+".csv"
                            #open_file(filename)
                            redirect_to :action => 'refreshmaster'
                            #render :update do |page|
                             #   page << "document.getElementById('aux_div').style.visibility = 'hidden'"
                            #end
                            #session[:msg]="Report Generated Succefully"
                            
                         end           
            else
                        
                        session[:msg]="Start Date should be always less than End Date"
                        redirect_to :action => 'properdatamaster'
            end
  rescue Exception=>exc
  #puts exc.message
 	session[:msg]="Please Select Proper Data"
   #puts "in error"
  redirect_to :action => 'properdatamaster'
  end
   
 end
 
def cmt_master
  @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
   @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
   
  if @start_date<@end_date
   puts @start_date
  puts @end_date
  puts @br= params[:transact][:soleid]
 @data=Transact.find(:all, :conditions => ["transdate between ? and ? and soleid=?", @start_date, @end_date,@br])
 else
   @st="0"
  end 


  end


def gen_file_master(fir,sec,bname,z,r,c,s_date,e_date)
  #begin
  one="Master_report"+".csv" 
  
  @header= ['Location SolID','Tokenno','Transaction Date','Generated Time','Called Time','Sec/Called Time','Serviced Time','Service Name','Counter No.','Teller Name','Wait Time','Time Taken','Total Time','STP Name','NonSTP Name','Token Status']
  if File.exists?(one)
    fp=File.open("Master_report"+".csv","a")   
     for item in sec
     d=item.serviceid

     @sname=Service.find_by_sql("select SVC_ServiceName from services where SVC_ServiceID='#{d}'")
     for sname in @sname
     st=sname.SVC_ServiceName
    
  end
  @ctno=Token.find_by_sql("Select counterno from tokens where tokenno='#{item.tokenno}'and locationid='#{item.locationid}'")
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
        @r=[item.locationid,item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,item.servicedtime,st1,d,item.login,item.waittime,item.timetaken,totaltime,item.stpname,item.nonstpname,"Served"]
         csv << @r
         elsif item.tokenstatus==3
            @r=[item.locationid,item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,'' ,st1,d,item.login,item.waittime,item.timetaken,item.waittime,item.stpname,item.nonstpname,"Missed"]
         csv << @r
         else
             @r=[item.locationid,tem.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,'','','',st1,d,'','','','',item.stpname,item.nonstpname,"Not Served"]
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
     @ctno=Token.find_by_sql("Select counterno from tokens where tokenno='#{item.tokenno}'and locationid='#{item.locationid}'")
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

        @r=[item.locationid,item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,item.servicedtime,st1,d,item.login,item.waittime,item.timetaken,totaltime,item.stpname,item.nonstpname,"Served"]
         csv << @r
         elsif item.tokenstatus==3
            @r=[item.locationid,item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,item.calledtime,item.call1,'' ,st1,d,item.login,item.waittime,item.timetaken,item.waittime,item.stpname,item.nonstpname,"Missed"]
         csv << @r
         else
             @r=[item.locationid,item.tokenno,item.transdate.strftime("%Y/%d/%m"),item.generatedtime,'','','',st1,d,'','','','',item.stpname,item.nonstpname,"Not Served"]
         csv << @r
           end
      end
       
    end
    fp.close
end
#puts " in generate"
 #render :update do |page|
#page << "document.getElementById('aux_div').style.visibility = 'hidden'"
#end
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

