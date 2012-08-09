class DatapurgeController < ApplicationController
  layout 'sidenew'
  def selection
     
        
      end
      
def selection2
begin
        @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
         @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
         @br= params[:location][:LOC_BranchName]
        if @br!=''
                      @todays_date=Time.now()
                      @tody_date=@todays_date.strftime("%Y-%m-%d")
                      @curr_day=Date.parse(@tody_date)
                      if @start_date <= @end_date
                                 if @end_date <= @curr_day
                                                 @soleid=Location.find(:first,:conditions =>["LOC_BranchName=?",@br])
                                                 @sol=@soleid.LOC_SoleID
                                                 @data=Transact.find_by_sql("select * from transacts where transdate between '#{@start_date}' and '#{@end_date}'  and 
                                             soleid='#{@sol}'")
                                                 if  @data != []
                                                                       Transact.destroy(@data)
                                                                        @msg=2
                                                                        render :action => "selection"
                                                 else
                                                                       @msg=4
                                                                       render :action => "selection"
                                                 end
                                 else
                                                 @msg=0 
                                                 render :action => "selection"  
                                 end
                      else
                                @msg=0 
                                render :action => "selection"       
                      end
        else
                      @todays_date=Time.now()
                      @tody_date=@todays_date.strftime("%Y-%m-%d")
                      @curr_day=Date.parse(@tody_date)
                      if @start_date <= @end_date
                                 if @end_date <= @curr_day
                                                 @all_branch_data=Transact.find_by_sql("select * from transacts where transdate between '#{@start_date}' and '#{@end_date}'")
                                                 if  @all_branch_data != []
                                                                       Transact.destroy(@all_branch_data)
                                                                        @msg=2
                                                                        render :action => "selection"
                                                 else
                                                                       @msg=4
                                                                       render :action => "selection"
                                                 end 
                                 else
                                                 @msg=0 
                                                 render :action => "selection"  
                                 end
                      else
                                @msg=0 
                                render :action => "selection"       
                      end
                      
        end
      end
rescue ArgumentError
        @msg=0
        render :action => "selection"  
end

end
