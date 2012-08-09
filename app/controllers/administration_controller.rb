class AdministrationController < ApplicationController
#before_filter :login_required
layout 'sidenew'
#require "Win32API"  
#require 'dl'

 
 #description
 def delete
    Thresholdtime.find(params[:id]).destroy
    redirect_to :action => 'list'
    flash[:notice] = fading_flash_message("Custmer type get deleted successfully.", 3)
  end
 def main
 end
 ############################ Custmer Type Starts ##############################################
 def new
   @threshold=Thresholdtime.new
 end
 ############################ Custmer Type Ends ##############################################
 def listsetting
     @setting=Setting.find(:all)
 end
 def esetting
 @setting = Setting.find(params[:id])
    if @setting.update_attributes(params[:setting])
      flash[:notice] = 'Setting was successfully updated.'
      redirect_to :action => 'listsetting'
    else
      render :action => 'esetting'
  end
  
end
def city
  
  case @request.method
      when :post
    
     
	@city=City.new(@params['city'])
  puts "*********************************************"
        @city.save
  puts "*********************************************"
        if @city.save    
	    redirect_to :action => "cityindex"          
	  end
	#end
	
      when :get
	@region = City.new
    end 
  end
################################# Custmer Type Create Starts ##############################
 def create
    @threshold=Thresholdtime.new(params[:threshold])
    if @threshold.save
      redirect_to :action =>'list'
      flash[:notice] = fading_flash_message("Custmer type get added successfully.", 3) 
    else
      render :action =>'new'
    end
  end
################################# Custmer Type Create Ends ##############################
  def canceladd
 render :update do |page|
   
     page.redirect_to url_for( :controller=>'administration', :action =>'list')
  end
    
  end
def list
  @threshold=Thresholdtime.find(:all)
end

def edit1
@threshold=Thresholdtime.find(params[:id])

end

def update
@threshold=Thresholdtime.find(params[:id])
if @threshold.update_attributes(params[:threshold])
    redirect_to :action =>'list'
    flash[:notice] = fading_flash_message("Custmer type get updated successfully.", 3)
  else
    render :action =>'edit1'
  end
end

 def cluster
  session[:loc]=nil
  session[:cls]="true"
  session[:uimp]=nil
 
    @zones  = Zone.find(:all)
    @regions = Region.find(:all)
   
     end
     
     def location
  session[:loc]="true"
   session[:cls]=nil
   session[:uimp]=nil
   session[:city]=nil
    @zones  = Zone.find(:all)
    @regions = Region.find(:all)
#    @clusters= Cluster.find(:all)
    session[:dt]="true"
    
      end
       
######################## Update Cluster For Collection Select Starts ######################################
def update_clusters
     cluster = Cluster.find_by_sql("select id, CLST_ClusterName from clusters where CLST_RegionID = #{params[:id]}")

     render :update do |page|
	              page.replace_html 'clusters', :partial => 'clusters', :object => cluster
     end
   end
######################## Update Cluster For Collection Select Ends ######################################
######################## Update Cluster For Collection Select Starts ######################################
def update_city
     city= City.find_by_sql("select id, cityname from cities where LOC_ClusterID = #{params[:id]}")
     render :update do |page|
	              page.replace_html 'cities', :partial => 'cities', :object => city
     end
   end
######################## Update Cluster For Collection Select Ends ######################################
######################## Update Region For Collection Select Starts ######################################
def update_regions
     region = Region.find_by_sql("select id, REG_RegionName from regions where REG_ZoneID = #{params[:id]}")
     cluster = ""
     render :update do |page|
	              if session[:cls]!=nil
	                 page.replace_html 'regions', :partial => 'regions', :object => region
	             else
	                page.replace_html 'regions', :partial => 'regions', :object => region
                  page.replace_html 'clusters', :partial => 'clusters', :object => cluster
               end
    end
end
######################## Update Region For Collection Select Ends ######################################
############################## Edit Cluster Starts ########################################
def editcluster
      session[:cluid]=params[:id]
      @zones  = Zone.find(:all)
end
############################## Edit Cluster Ends ########################################    
################################# Delete Cluster Starts ###################################
def deletecluster
  @clusters_id=params[:id]
    Cluster.find(params[:id]).destroy
           @cities_id=City.find(:all,:select =>"id",:conditions =>["LOC_ClusterID=?","#{@clusters_id}"])
           @cities_id.each  do |citydelete|
                 citydelete.destroy
                 @branchs_id=Location.find(:all,:select =>"id",:conditions =>["LOC_CityID=?",citydelete.id])
                 @branchs_id.each do |branchdelete|
                     branchdelete.destroy
                   end
            end     
           session[:msg]="true"
           redirect_to :action => 'cluster'
           flash[:notice] = fading_flash_message("Cluster and related cities get deleted successfully.", 3)     
  end
################################# Delete Cluster Ends ###################################
################################# Update Cluster Starts ###################################
  def updatecluster
       @cluster= Cluster.find(session[:cluid])
       if @cluster.update_attributes(params[:cluster])
          session[:d]="true"
	        redirect_to :action => 'cluster'
          flash[:notice] = fading_flash_message("Cluster get updated successfully.", 3)     
       else
          render :action => 'editcluster'
       end
  end
################################# Update Cluster Ends ###################################
 #################################### Show Cluster Starts ##################################
def showcluster
  puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  puts @a=params[:cluster][:CLST_ClusterName]
  puts @b=params[:cluster][:id]
  puts @c=params[:cluster][:CLST_RegionID]
    if params[:cluster][:CLST_ClusterName]==""  and  params[:cluster][:id]=="" and  params[:cluster][:CLST_RegionID]==""
	                session[:msg]="true"
    else
           if params[:cluster][:CLST_ClusterName]==""
	                        session[:cname]=nil
           else
	                        session[:cname]=params[:cluster][:CLST_ClusterName]
           end
           if params[:cluster][:id]==""
	                        session[:cid]=nil
          else
	                        session[:cid]=params[:cluster][:id]
         end
         if params[:cluster][:CLST_RegionID]==""
	                        session[:rid]=nil
                          #sesion[:zid]=nil
        else
	                        session[:rid]=params[:cluster][:CLST_RegionID]
        end
    end
    
         render :update do |page|
	    page.replace_html('cluster_div',:partial=>'displaycls')
	  end 
 end
#################################### Show Cluster Ends ##################################
#################################### Add Cluster Starts ##################################
def addcluster
     case @request.method
          when :post
                    @zones  = Zone.find(:all)
	                  @cluster=Cluster.new(@params['cluster'])
	                  if @cluster.save    
	                                 redirect_to :action => "cluster"
                                   flash[:notice] = fading_flash_message("Cluster get successfully added.", 3)                                   
                   end 
         when :get
	                 @zones  = Zone.find(:all)
	                 @regions = Region.find(:all)
	                 @cluster= Cluster.new
     end    
 end
 #################################### Add Cluster Ends ##################################
 #################################### Add City Starts ##################################
 def addcity123
   @location=City.new(@params['location'])
     if @location.save    
	      redirect_to :action => "cityindex" 
        flash[:notice] = fading_flash_message("City get successfully added.", 3)  
	   end
 end
#################################### Add City Ends ##################################
#################################### City starts ##################################
def cityindex
  session[:loc]="true"
  session[:cls]=nil
  session[:city]="true"
  @city=City.find(:all)
  puts @city.inspect
end
#################################### City Ends ##################################
#################################### Edit City starts ###############################
def editcity
     session[:city_id]=params[:id]
   end
#################################### Edit City Ends ###############################
#################################### Update City starts ###############################
def updatecity
     @location=City.find(session[:city_id])
     if @location.update_attributes(params[:location])
        @location.update_attributes(params[:city])
        redirect_to :action => 'cityindex'
        flash[:notice] = fading_flash_message("City get updated successfully.", 3) 
     else
        render :action => 'editcity'
     end
end
#################################### Update City Ends ###############################
#################################### Delete City Starts ###############################
def deletecity
    @city_id=params[:id]
     City.find(params[:id]).destroy
      @branchs_id=Location.find(:all,:select =>"id",:conditions =>["LOC_CityID=?","#{@city_id}"])
                 @branchs_id.each do |branchdelete|
                     branchdelete.destroy
                   end
     redirect_to :action => "cityindex" 
     flash[:notice] = fading_flash_message("City get deleted successfully.", 3)    
 end
 #################################### Delete City Ends ###############################
 def editgroup
   session[:grpid]=params[:id]
 end
 ################################ Update Group Starts ########################################
 def updategroup
      @group= Group.find(session[:grpid])
      if @group.update_attributes(params[:group])
	                  session[:d]="true"
	                  redirect_to :action => 'group'
                      flash[:notice] = fading_flash_message("Group get updated successfully.", 3)  
    else
      render :action => 'editgroup'
    end
  end
################################ Update Group Ends ########################################
################################ Delete Group Starts ########################################
 def deletegroup
   @group_id=params[:id]
    Group.find(params[:id]).destroy
    @branchs_id=Location.find(:all,:select =>"id",:conditions =>["LOC_GroupID=?","#{@group_id}"])
                 @branchs_id.each do |branchdelete|
                     branchdelete.destroy
                   end
    @services_id=Service.find(:all,:select =>"id,SVC_ServiceID",:conditions =>["SVC_GroupID=?","#{@group_id}"])
                 @services_id.each do |servicedelete|
                     servicedelete.destroy
                     @stp_reason_id=STPReason.find(:all,:select =>"id",:conditions =>["STP_ServiceID=?",servicedelete.SVC_ServiceID])
                          @stp_reason_id.each do |stpdelete|
                              stpdelete.destroy 
                          end
                   end
    session[:msg]="true"
    redirect_to :action => 'group'
    flash[:notice] = fading_flash_message("Group get deleted successfully.", 3)  
  end
################################ Delete Group Ends ########################################
 ################################ Show Group Startss ########################################n 
def showgroup
      if (params[:group][:id]=="" and params[:group][:GRP_GroupName]=="")
        session[:msg]="true"
      end
      if params[:group][:id]==""
        session[:gid]=nil
      else
        session[:gid]=params[:group][:id]
      end
      if params[:group][:GRP_GroupName]==""
        session[:gname]=nil
      else
        session[:gname]=params[:group][:GRP_GroupName]
      end
    render :update do |page|
     page.replace_html('group_div',:partial=>'displaygrp')
    end 
end
 ################################ Show Group Ends ########################################
 ################################## Add Group Starts #######################################
 def addgroup
    case @request.method
            when :post
	          @group=Group.new(@params['group'])
	          if @group.save    
	             redirect_to :action => "group" 
               flash[:notice] = fading_flash_message("Group get added successfully.", 3)             
	         end
           when :get
              @group=Group.new
           end  
  end
 ################################## Add Group Ends #######################################
  
  def change
    
    
    if session[:ac]=='0'
      
      session[:ac]=1
     else
      
       session[:ac]=0
     end
   end
   
  
  
  def updatelocation1

       @location= Location.find(session[:lid])
       @id=Location.find_by_sql("select LOC_SoleID from locations where id=#{session[:lid]}")
       for i in @id
       @soleid=i.LOC_SoleID
       end
  
  
   #if params[:location][:LOC_IsActive]==0
     #else
     #end
    
     params[:location][:LOC_IsActive]=session[:ac]
     session[:ac]=nil
    
     
    if @location.update_attributes(params[:location])
	session[:d]="true"
	if @soleid!=params[:location][:LOC_SoleID]
         
	
	  end
	 session[:uloc]=nil
	 
	redirect_to :action => 'location'
    else
      render :action => 'editlocation'
    end
end
  
def addr
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addregion')
end

end
def addser
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addservices')
end

end
def toser
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'service_master')
end

end
def addpause
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addpausereason')
end

end
def topause
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'pausereason')
end

end
def addnstp
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addnonstpreasons')
end

end
def tononstp
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'nonstpreasons')
end

end
def addloc
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addlocation')
end

end
def addstp
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addstpreason')
end

end
def tostp
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'stpreason')
end

end
def addz
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addzone')
end
end
def addg
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addgroup')
end
end
def addc
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addcluster')
end
end
def tog
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'group')
end
end
def addv
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'addvendor')
end
end
def toc
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'cluster')
end
end
def tov
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'vendor')
end
end
def toz
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'zone')
end
end
def tol
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'location')
end
end

def cityback
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'cityindex')
end  
end

def tor
  render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'region')
end
end

def tomain
    render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'main')
end
end


####################### Add Location(Branch Details) Starts #####################################
def addlocation
     case @request.method
     when :post
              if params[:location][:LOC_IsActive]==nil
                 params[:location][:LOC_IsActive]='0'
              end
             @location=Location.new(@params['location'])
	           if @location.save    
                redirect_to :action => "location" 
                flash[:notice] = fading_flash_message("Branch details added successfully.", 3)                
	     end
      when :get
              @zones  = Zone.find(:all)
              @regions = Region.find(:all)
              @clusters= Cluster.find(:all)
              @location= Location.new
      end  
end
####################### Add Location(Branch Details) Ends #####################################
####################### Show Location(Branch Details) starts #####################################
def showlocation
      if params[:location][:LOC_SoleID]==""
	  session[:locationid]=nil
      else
	   session[:locationid]= params[:location][:LOC_SoleID]
      end
      if params[:location][:LOC_BranchName]==""
	   session[:bname]=nil
      else
	   session[:bname]= params[:location][:LOC_BranchName]
      end
      if params[:location][:LOC_GroupID]=='-1'
	    session[:gid]=nil
      else
	    session[:gid]=params[:location][:LOC_GroupID]
      end
      if params[:location][:LOC_CityID]==""
	    session[:cid]=nil
      else
	    session[:cid]=params[:location][:LOC_CityID]
      end
      if params[:location][:LOC_IsActive]=='-1'
	 session[:isa]=nil
      else
	    
	    session[:isa]=params[:location][:LOC_IsActive]
      end
if (  params[:location][:LOC_IsActive]=="-1" and params[:location][:LOC_SoleID]=="" and params[:location][:LOC_BranchName]=="" and params[:location][:LOC_GroupID]=='-1' and params[:location][:LOC_ClusterID]=="")
 session[:msg] ="true"
  end
  render :update do |page|
     page.replace_html('location_div',:partial=>'displayloc')
  end 
end
######################### Show Location(Branch Details) Ends #####################################
####################### Edit Location(Branch Details) Starts #####################################
def editlocation
     @zones  = Zone.find(:all)
     @regions = Region.find(:all)
     session[:ulos]="true"
     session[:lid]=params[:id]
     @r=Location.find_by_sql("select LOC_IsActive from locations where id=#{session[:lid]}")
    for item in @r
         t=item.LOC_IsActive
    end
    session[:ac]=t
end
####################### Edit Location(Branch Details) Ends #####################################
####################### Update Location(Branch Details) Starts #####################################
def updatelocation
     @id=Location.find_by_sql("select LOC_SoleID from locations where id=#{session[:lid].to_i}")
     for i in @id
            soleid=i.LOC_SoleID
     end
    @location= Location.find(session[:lid])
     params[:location][:LOC_IsActive]=session[:ac]
     session[:ac]=nil
     if @location.update_attributes(params[:location])
	      session[:d]="true"
        session[:uloc]=nil
        if soleid!=params[:location][:LOC_SoleID]
	                   @d=DataImportStatus.find_all(["IMP_LocationID=?",soleid])
	                   @d.each do |d|
                          d.IMP_LocationID=params[:location][:LOC_SoleID]
	                        d.save
	                   end
                     @d=DataExportStatus.find_all(["EXP_LocationID=?",soleid])
	                   @d.each do |d|
	                        d.EXP_LocationID=params[:location][:LOC_SoleID]
                          d.save
                     end
                    @d=Token.find_all(["LocationID=?",soleid])
	                  @d.each do |d|
                         d.LocationID=params[:location][:LOC_SoleID]
	                       d.save
                    end
       end
	    redirect_to :action => 'location'
      flash[:notice] = fading_flash_message("Branch details updated successfully.", 3)
    else
      render :action => 'editlocation'
     end
  end
####################### Update Location(Branch Details) Ends #####################################
####################### Delete Location(Branch Details) Starts #####################################
  def deletelocation
        Location.find(params[:id]).destroy
        session[:msg]="true"
        redirect_to :action => 'location'
        flash[:notice] = fading_flash_message("Branch details deleted successfully.", 3)
  end 
 ####################### Delete Location(Branch Details) Ends #####################################
################################## Edit Region Starts ####################################
def editregion
      session[:regid]=params[:id]
end
################################## Edit Region Ends ####################################
################################## Update Region Starts ####################################
def updateregion
     @region= Region.find(session[:regid])
        if @region.update_attributes(params[:region])
                   session[:d]="true"
	                 redirect_to :action => 'region'
                   flash[:notice] = fading_flash_message("Region get updated successfully.", 3)
       else
                   render :action => 'editregion'
      end
  end
################################## Update Region Ends ####################################
################################## Show Region Starts ####################################
def showregion
    ##This will check whether parameters are null or not
      if params[:region][:REG_RegionName]==""
	session[:rname]=nil
      else
	session[:rname]=params[:region][:REG_RegionName]
      end
      if params[:region][:id]==""
	session[:rid]=nil
      else
	session[:rid]=params[:region][:id]
      end
     
      if params[:region][:REG_ZoneID]==""
	session[:zid]=nil
      else
        if params[:region][:REG_ZoneID]=='-1'
	   session[:zid]=nil
        else
	  session[:zid]=params[:region][:REG_ZoneID]
        end
      end
      
      if params[:region][:REG_RegionName]=="" and params[:region][:id]=="" and params[:region][:REG_ZoneID]=='-1'
        session[:msg]="true"
      end
    render :update do |page|
     page.replace_html('region_div',:partial=>'displayregion')
   end 
 end
 ################################## Show Region Ends ####################################
################################## Delete Region Starts ####################################
 def deleteregion
   @regions_id=params[:id]
    Region.find(params[:id]).destroy
             @clusters_id=Cluster.find(:all,:select =>"id",:conditions =>["CLST_RegionID=?","#{@regions_id}"])
             @clusters_id.each do |clusterdelete|
                               clusterdelete.destroy
                               @cities_id=City.find(:all,:select =>"id",:conditions =>["LOC_ClusterID=?",clusterdelete.id])
                               @cities_id.each  do |citydelete|
                                             citydelete.destroy
                                             @branchs_id=Location.find(:all,:select =>"id",:conditions =>["LOC_CityID=?",citydelete.id])
                                             @branchs_id.each do |branchdelete|
                                              branchdelete.destroy
                   end
                               end
              end
              session[:msg]="true"
              redirect_to :action => 'region'
              flash[:notice] = fading_flash_message("Region and related clusters and cities get deleted successfully.", 3)
  end
################################## Delete Region Ends ####################################
################################## Add Region Starts ####################################
def addregion
  case @request.method
      when :post
	              @region=Region.new(@params['region'])
                if @region.save    
	                 redirect_to :action => "region" 
                  flash[:notice] = fading_flash_message("Region get successfully added.", 3)
	              end
      when :get
	              @region = Region.new
      end     
end
################################## Add region Ends ####################################
########################### Show Zone Starts ########################################
def showzone
  ###Checking the condition for selection criterion
     if params[:zone][:ZONE_ZoneName]==""
                  session[:zonename]=nil
     else
                  session[:zonename]=params[:zone][:ZONE_ZoneName]
     end
     if params[:zone][:id]==""
                  session[:zoneid]=nil
     else
                @zoneid_check=params[:zone][:id]
                @b=@zoneid_check.to_i
                 if @b!=0
                        session[:zoneid]=params[:zone][:id]
                 else 
                        puts "Invalid Data"
                        
                 end
                  
     end
     if params[:zone][:id]=="" and params[:zone][:ZONE_ZoneName]==""
                  session[:msg]="true"
     end
    render :update do |page|
	      page.replace_html('zone_div', :partial=>'display')
    end
end
########################### Show Zone Ends ########################################
#def edit
    #@zone = Zone.find(params[:id])
 #end
  ############################## Edit Zone Starts ######################################
  def editzone
    session[:zid]=params[:id]
  end
  ############################## Edit  Zone Ends #######################################
  ############################## Delete Zone Starts #####################################
  def deletezone
    @zones_id=params[:id]
    Zone.find(params[:id]).destroy
    @regions_id=Region.find(:all,:select =>"id",:conditions =>["REG_ZoneID=?","#{@zones_id}"])
    puts @regions_id.inspect
       @regions_id.each do |regiddelete|
                 regiddelete.destroy
                 
           @clusters_id=Cluster.find(:all,:select =>"id",:conditions =>["CLST_RegionID=?",regiddelete.id])
           @clusters_id.each do |clusterdelete|
                 clusterdelete.destroy
           @cities_id=City.find(:all,:select =>"id",:conditions =>["LOC_ClusterID=?",clusterdelete.id])
           @cities_id.each  do |citydelete|
                 citydelete.destroy
                 @branchs_id=Location.find(:all,:select =>"id",:conditions =>["LOC_CityID=?",citydelete.id])
                 @branchs_id.each do |branchdelete|
                     branchdelete.destroy
                   end
           end
    end
  end
    session[:delzone]="true"
    redirect_to :action => 'zone'
    flash[:notice] = fading_flash_message("Zone and related regions,clusters and cities get deleted successfully.", 3)
 end
 ############################## Delete Zone Ends #####################################
 ############################## Update Zone Starts #####################################
def updatezone
       @zone= Zone.find(session[:zid])
       if @zone.update_attributes(params[:zone])
	                        session[:d]="true"
	                        redirect_to :action => 'zone'
                          flash[:notice] = fading_flash_message("Zone get updated successfully.", 3)
       else
                          render :action => 'editzone'
      end
end
############################## Update Zone Ends #####################################
############################### Add Zone Starts ##################################
def addzone
   case @request.method
           when :post
	                   @zone=Zone.new(@params['zone'])
                     if @zone.save 
                        redirect_to :action => "zone"   
                        #message = "Zone is get added successfully"  
                        #title = "ICICI CMT"  
                        #api = Win32API.new('user32','MessageBox',['I', 'P', 'P', 'I'],'I') 
                        #api.call(0,message,title,0)   
                        #user32 = DL.dlopen('user32')
                        #msgbox = user32['MessageBoxA', 'ILSSI']
                        #txt="Fineeeeeeeeee"
                        #title="Welcome"
                        #msgbox.call(0, txt, title,0)
                        flash[:notice] = fading_flash_message("Zone get added successfully.", 3)
                     end
           when :get
                      @zone = Zone.new
   end     
end      
################################## Add Zone Ends ##################################
################################## Edit Vendor Starts ################################
  def editvendor
    session[:venid]=params[:id]
  end
################################## Edit Vendor Ends ##################################
################################## Delete Vendor Starts ##################################
  def deletevendor
       Dqmvendor.find(params[:id]).destroy
       session[:msg]="true"
       redirect_to :action => 'vendor'
       flash[:notice] = fading_flash_message("Vender get deleted successfully .", 3)
  end
################################## Delete Vendor Ends ##################################
################################## Update Vendor Starts ##################################
  def updatevendor
       @dqmvendor= Dqmvendor.find(session[:venid])
       if @dqmvendor.update_attributes(params[:dqmvendor])
	        session[:d]="true"
          redirect_to :action => 'vendor'
          flash[:notice] = fading_flash_message("Vender get updated successfully .", 3)
       else
          render :action => 'editvendor'
       end
     end
################################## Update Vendor Ends ##################################
 ################################# Add Vendor Starts #####################################
 def addvendor
      case @request.method
      when :post
               @dqmvendor=Dqmvendor.new(@params['dqmvendor'])
	             if @dqmvendor.save    
	                redirect_to :action => "vendor"
                  flash[:notice] = fading_flash_message("Vender get added successfully .", 3)
	             end
      when :get
	             @dqmvendor = Dqmvendor.new
      end    
end
#################################### Add Vendor Ends #####################################

##Show Vendor Starts
 
 def showvendor
     if params[:dqmvendor][:id]=="" and params[:dqmvendor][:VND_VendorName]==""
	session[:msg]="true"
        
    else
	if params[:dqmvendor][:id]==""
	    session[:vid]=nil
	else
	    session[:vid]=params[:dqmvendor][:id]
	end
	if params[:dqmvendor][:VND_VendorName]==""
	    session[:vname]=nil
	else
	    session[:vname]=params[:dqmvendor][:VND_VendorName]
	end
       
     end
     render :update do |page|
	page.replace_html('vendor_div',:partial=>'displayvendor')
      end 
end
##Show Vendor Ends

 def cancelzone
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'zone')
end
end

 def cancelgroup
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'group')
end
end
 def cancelregion
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'region')
end
end

 def cancelvendor
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'vendor')
end
end

 def cancellocation
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'location')
end
end
 def cancelcluster
render :update do |page|

page.redirect_to url_for(:controller=>'administration', :action=>'cluster')
end
end
#################################### Edit Pause Starts ##################################
  def editpause
    @pause = PauseReason.find(params[:id])
  end
#################################### Edit Pause Ends ##################################
#################################### Delete Pause Starts ##################################
 def deletepause
    PauseReason.find(params[:id]).destroy
     session[:msg]="true"
    redirect_to :action => 'pausereason'
    flash[:notice] = fading_flash_message("Pause reason get deleted successfully .", 3)
  end
#################################### Delete Pause Ends ##################################
#################################### Update Pause Starts ##################################
def updatepause
       @pause= PauseReason.find(session[:pid])
       if @pause.update_attributes(params[:pausereason])
          session[:d]="true"
	        redirect_to :action => 'pausereason' 
          flash[:notice] = fading_flash_message("Pause reason get updated successfully .", 3)
       else
          render :action => 'editpause'
       end
  end
####################################Update Pause Ends ##################################
#################################### Cancel Pause Starts ##################################
def cancelpause
      render :update do |page|
                 page.redirect_to url_for(:controller=>'administration', :action=>'pausereason')
      end
end
#################################### Cancel Pause Ends ##################################
#################################### Pause Starts ##################################
def pausereason
end
#################################### Pause Ends ##################################
####################################Add Pause Starts ##################################
def addpausereason
   case @request.method
      when :post
         @pausereason=PauseReason.new(@params['pausereason'])
        if @pausereason.save    
			     redirect_to :action => "pausereason" 
           flash[:notice] = fading_flash_message("Pause reason get added successfully .", 3)           
	      end
      when :get
        @pausereason = PauseReason.new
   end
end
####################################Add Pause Ends ##################################
def showdetails
   if(params[:pausereason][:PR_PauseReasonDesc]!="") and (params[:pausereason][:id]!="")
       session[:pauseid]=params[:pausereason][:id]
      
         session[:pausename]=params[:pausereason][:PR_PauseReasonDesc]
         render :update do |page|
	 page.replace_html('pause_div',:partial=>'pause')
         end 
   elsif (params[:pausereason][:id]!="")
        
        session[:pauseid]=params[:pausereason][:id]
      
        render :update do |page|
         page.replace_html('pause_div',:partial=>'pause')
         end 
    elsif (params[:pausereason][:PR_PauseReasonDesc]!="")
       
        session[:pausename]=params[:pausereason][:PR_PauseReasonDesc]
       
        render :update do |page|
        page.replace_html('pause_div',:partial=>'pause')
        end
else
       session[:msg]="true"
       render :update do |page|
       page.replace_html('pause_div',:partial=>'pause')
       end
  end
end
############################### Service_Master Starts ######################################
 def service_master
 end
 ############################### Service_Master Ends ######################################
########################### Delete Service Starts ###########################################
def deleteservice
      @services_id=Service.find(params[:id]) 
     @service_ID=Service.find(:first,:select =>"SVC_ServiceID",:conditions =>["id=?","#{@services_id.id}"])
        Service.find(params[:id]).destroy    
              @stp_services=STPReason.find(:all,:select =>"id",:conditions =>["STP_ServiceID=?",@service_ID.SVC_ServiceID])
           @stp_services.each do |stpdelete|
                 stpdelete.destroy
            end
      session[:delser]="true"
      redirect_to :action => 'service_master'
      flash[:notice] = fading_flash_message("Service and related STP reasons get deleted successfully .", 3)
  end
########################### Delete Service Ends ###########################################
############################## Edit Service starts #########################################
   def editservice
    @services = Service.find(params[:id])
  end
############################## Edit Service Ends #########################################
########################### Delete Service Ends ###########################################
  def updateservice
    h=params[:services][:"SVC_ThresholdTimeMins(4i)"].to_i
    m=params[:services][:"SVC_ThresholdTimeMins(5i)"].to_i
    s=params[:services][:"SVC_ThresholdTimeMins(6i)"].to_i
    t=h.to_s+":"+m.to_s+":"+s.to_s
   @services= Service.find(session[:srid])
   if @services.update_attributes(params[:services])
	      @s=Service.find_first(["SVC_ServiceID=?",params[:services][:SVC_ServiceAcronym]])
      if @s!=nil
	         @s1=Service.find_first(["SVC_ServiceID='Y' and SVC_ServiceAcronym='D'"])
	          if @s1==nil
	             @services.SVC_ServiceID="Y"
	        else
              @s2=Service.find_first(["SVC_ServiceAcronym='W'"])
              if @s2==nil
                 @services.SVC_ServiceID="Z"
              else
                 @services.SVC_ServiceID=@services.SVC_ServiceAcronym
              end
          end
      else
         @services.SVC_ServiceID=@services.SVC_ServiceAcronym
      end
	       @services.save
	        redirect_to :action => 'service_master'
          flash[:notice] = fading_flash_message("Service get updated successfully .", 3)
    else
      render :action => 'editservice'
    end
end
################################### Update Service Ends #########################################
################################### Cancel Service Starts ########################################
def cancelservice
      render :update do |page|
                 page.redirect_to url_for(:controller=>'administration', :action=>'service_master')
      end
end
################################### Cancel Service Ends #########################################
################################### Add Service Starts #########################################
 def addservices
   if session[:role] == "cmt_Admin"
    
        case @request.method
        when :post
                 ### time starts from 4i (HH)
                 h=params[:services][:"SVC_ThresholdTimeMins(4i)"].to_i
                 m=params[:services][:"SVC_ThresholdTimeMins(5i)"].to_i
                 s=params[:services][:"SVC_ThresholdTimeMins(6i)"].to_i
                 t=h.to_s+":"+m.to_s+":"+s.to_s
                 @services=Service.new(@params['services'])
                 @s=Service.find_first(["SVC_ServiceID=?",@services.SVC_ServiceAcronym])
                 if @s!=nil
                    @s1=Service.find_first(["SVC_ServiceID='Y'"])
                    if @s1==nil
                       @services.SVC_ServiceID="Y"
                    else
		                  @services.SVC_ServiceID="Z"
                    end
                else
                     @services.SVC_ServiceID=@services.SVC_ServiceAcronym
                end
                if @services.save
                   redirect_to :action => "service_master"
                   flash[:notice] = fading_flash_message("Service get added successfully .", 3)
               end
       when :get
               @services= Service.new
       end 
   else
     
#For admin & operator distinguish--------------------------------------
   case @request.method
           when :post
                    ### time starts from 4i (HH)
                    h=params[:services][:"SVC_ThresholdTimeMins(4i)"].to_i
                    m=params[:services][:"SVC_ThresholdTimeMins(5i)"].to_i
                    s=params[:services][:"SVC_ThresholdTimeMins(6i)"].to_i
                    t=h.to_s+":"+m.to_s+":"+s.to_s
	                  @services=Service.new(@params['services'])
                    if @s!=nil
	                     @s1=Service.find_first(["SVC_ServiceID='Y'"])
	                     if @s1==nil
                          @services.SVC_ServiceID="Y"
	                     else
                          @services.SVC_ServiceID="Z"
                       end
                   else
	                    @services.SVC_ServiceID=@services.SVC_ServiceAcronym
                   end
	                 if @services.save
                      redirect_to :action => "service_master"
                      flash[:notice] = fading_flash_message("Service get added successfully .", 3)
                   end
           when :get
                    @services= Service.new
          end
  end
end
################################### Add Service Ends #########################################
################################### Show Service Starts #######################################
def showservices
    if params[:services][:id]==""
	  session[:servicesid]=nil
    else
	   session[:servicesid]= params[:services][:id]
        end
        if params[:services][:SVC_ServiceName]==""
	   session[:bname]=nil
        else
	   session[:bname]= params[:services][:SVC_ServiceName]
        end
         if params[:services][:SVC_GroupID]=='-1'
	    session[:gid]=nil
        else
	    session[:gid]=params[:services][:SVC_GroupID]
	  end
	  if params[:services][:SVC_ServiceAcronym]==""
	    session[:acro]=nil
        else
	    session[:acro]=params[:services][:SVC_ServiceAcronym]
        end
	  if params[:services][:SVC_IsActive]=='-1'
	    session[:isa]=nil
	    
        else
	    session[:isa]=params[:services][:SVC_IsActive]
	    p
	  end
	   if params[:services][:SVC_ServiceTypeID]=='-1'
	    session[:sid]=nil
	    
        else
	    session[:sid]=params[:services][:SVC_ServiceTypeID]
	    
        end
if( params[:services][:id]=="" and  params[:services][:SVC_ServiceName]==""  and  params[:services][:SVC_ServiceAcronym]=="" and params[:services][:SVC_GroupID]=='-1' and params[:services][:SVC_ServiceTypeID]=='-1' and params[:services][:SVC_IsActive]='-1')
        session[:msg]="true"
      end
     render :update do |page|
     page.replace_html('services_div',:partial=>'services')
   end 
   end
################################### Show Service Ends #######################################
#####################################  STP Reason Starts ##################################### 
  def stpreason
  end
#####################################  STP Reason Starts ##################################### 
 ################################## Edit  STP Reason Starts ##################################### 
 def editstp
    @stp = STPReason.find(params[:id])
  end
 ################################### Edit  STP Reason Ends ##################################### 
  ################################### Delete  STP Reason Starts ###################################
 def deletestp
   STPReason.find(params[:id]).destroy
    session[:msg]="true"
    redirect_to :action => 'stpreason'
    flash[:notice] = fading_flash_message("STP get deleted successfully .", 3)
  end
 ################################### Delete  STP Reason Ends #####################################
################################### Update  STP Reason Starts ####################################
 def updatestp
      @stp= STPReason.find(session[:stid])
      if @stp.update_attributes(params[:stpreason])
	       session[:d]="true"
	       redirect_to :action => 'stpreason'
         flash[:notice] = fading_flash_message("STP get updated successfully .", 3)
      else
         render :action => 'editstp'
    end
  end
################################### Update  STP Reason Ends ###################################
################################### Cancel  STP Reason Starts ###################################
def cancelstp
     render :update do |page|
                page.redirect_to url_for(:controller=>'administration', :action=>'stpreason')
     end
   end
################################### Cancel  STP Reason Ends ###################################
################################# Add STP Reason Starts ##################################
def addstpreason
  case @request.method
          when :post
                   @stpreason=STPReason.new(@params['stpreason'])
                   if @stpreason.save
	                 redirect_to :action => "stpreason"  
                   flash[:notice] = fading_flash_message("STP get added successfully .", 3)                   
         end
        when :get
          @stpreason = STPReason.new
       end 
end
################################# Add STP Reason Ends ##################################
############################### Show STP Starts #######################################
def showstp
  if params[:stpreason][:id]==""
	   session[:stpid]=nil
      else
	   session[:stpid]= params[:stpreason][:id]
      end
   if params[:stpreason][:STP_STPReason]==""
	  session[:stpname]=nil
      else
	   session[:stpname]= params[:stpreason][:STP_STPReason]
      end
      
      if params[:stpreason][:STP_ServiceID]=='-1'
	    session[:stpser]=nil
      else
	    session[:stpser]=params[:stpreason][:STP_ServiceID]
	  end
	
if( params[:stpreason][:STP_STPReason]=="" and  params[:stpreason][:id]==""  and  params[:stpreason][:STP_ServiceID]=='-1')
        session[:msg]="true"
      end
    render :update do |page|
     page.replace_html('stpreason_div',:partial=>'stp')
   end           
     end       
############################### Show STP Ends #######################################
############################### NON STP Starts #######################################
def nonstpreason
end
############################### NON STP Ends #######################################
############################### Edit NON STP Starts ####################################
 def editnonstp
    @nonstp = NonSTPReason.find(params[:id])
  end
############################### Edit NON STP Ends ####################################
 ############################### Delete NON STP Starts ####################################
 def deletenonstp
   NonSTPReason.find(params[:id]).destroy
    session[:msg]="true"
    redirect_to :action => 'nonstpreasons'
    flash[:notice] = fading_flash_message("NON STP get deleted successfully .", 3)    
  end
############################### Delete NON STP Ends ####################################
############################### Update NON STP Starts ####################################
def updatenonstp
       @nonstp= NonSTPReason.find(session[:nsid])
       if @nonstp.update_attributes(params[:nonstpreason])
          session[:d]="true"
         	redirect_to :action => 'nonstpreasons'
          flash[:notice] = fading_flash_message("NON STP get updated successfully .", 3)    
       else
          render :action => 'editnonstp'
       end
     end
############################### Update NON STP Ends ####################################
############################### Cancel NON STP Starts ####################################
def cancelnonstp
      render :update do |page|
                 page.redirect_to url_for(:controller=>'administration', :action=>'nonstpreasons')
      end
end
############################### Cancel NON STP Ends ####################################
############################### Show NON STP Starts ####################################
 def shownonstp
   if params[:nonstpreason][:id]==""
	   session[:nstpid]=nil
      else
	   session[:nstpid]= params[:nonstpreason][:id]
      end
   if params[:nonstpreason][:NSTP_NonSTPReason]==""
	  session[:nstpdesc]=nil
      else
	   session[:nstpdesc]= params[:nonstpreason][:NSTP_NonSTPReason]
      end
      
      if params[:nonstpreason][:NSTP_GroupID]=='-1'
	    session[:gid]=nil
      else
	    session[:gid]=params[:nonstpreason][:NSTP_GroupID]
	  end
	
if( params[:nonstpreason][:NSTP_NonSTPReason]==""  and  params[:nonstpreason][:id]==""  and  params[:nonstpreason][:NSTP_GroupID]=='-1')
        session[:msg]="true"
      end
    render :update do |page|
     page.replace_html('nonstp_div',:partial=>'nonstp')
   end           
end       
############################### Show NON STP Ends ##########################################
 #################################### Add NON STP Ends #######################################
def addnonstpreasons
  case @request.method
      when :post
        @nonstpreason=NonSTPReason.new(@params['nonstpreason'])
        if @nonstpreason.save    
	         redirect_to :action => "nonstpreasons" 
           flash[:notice] = fading_flash_message("NON STP get added successfully .", 3)             
        end
      when :get
        @nonstpreason = NonSTPReason.new
      end 
end
#################################### Add NON STP Ends #######################################

    def password 

   @userss = User.find(@session['user'].id)
   
   case @request.method
      when :post
      if@params['new_password']==""     
	#page.replace_html 'passwd', 'You have introduced a wrong password!'        
	@msg= 'Please enter your new Password !'
      end
      if@params['old_password']==""     
	#page.replace_html 'passwd', 'You have introduced a wrong password!'        
	@msg= 'Please enter your old Password !'
      end
        if @params['new_password_confirmation']==""     
	#page.replace_html 'passwd', 'You have introduced a wrong password!'        
	@msg= 'Please enter your Password again for confirmation!'
        end
        unless @userss.password_check?(@params['old_password'])   
	#page.replace_html 'passwd', 'You have introduced a wrong password!'  
   
	@msg= 'You have introduced a wrong old password!'
	else
	unless @params['new_password'] == @params['new_password_confirmation']
	  @msg = 'Your new password and password confirmation dont match!'
	  else
	   
	# puts @userss.loginstatus
	  @msg = 'Your password was changed successfully!' if @userss.change_password(@params['new_password'])
	  
	 end
	
	#page.redirect_to url_for(:controller=>"users", :action => "change_password")
	#redirect_back_or_default :controller => "users", :action => "admin" 
        end
    #end
  end
    #end
  end

def hello
  
end
def addservicesapp
  
end

def index
  if session[:role] == "Admin"
 puts "u r in cmt admin area..............................."      
     case @request.method
      when :post
      
     
### time starts from 4i (HH)
h=params[:services][:"SVC_ThresholdTimeMins(4i)"].to_i

m=params[:services][:"SVC_ThresholdTimeMins(5i)"].to_i
s=params[:services][:"SVC_ThresholdTimeMins(6i)"].to_i


        
        t=h.to_s+":"+m.to_s+":"+s.to_s
   
    
	 @services=Service.new(@params['services'])
   @s=Service.find_first(["SVC_ServiceID=?",@services.SVC_ServiceAcronym])
	       
	      if @s!=nil
	                   @s1=Service.find_first(["SVC_ServiceID='Y'"])
	                   if @s1==nil
                        @services.SVC_ServiceID="Y"
	                  else
		                   @services.SVC_ServiceID="Z"
	                  end
	        
	      else
	      
	                 @services.SVC_ServiceID=@services.SVC_ServiceAcronym
        end
	     @services.save
       @services.save
   
      when :get
     
        @services= Service.new
        
      end 
      
      else
        
#For admin & operator distinguish--------------------------------------
puts "++++++++++++++++++++++++++++++++++++++++++++sandip+++++++++++++++++++++++++++++++++++++"
        case @request.method
      when :post
      
     
### time starts from 4i (HH)
h=params[:services][:"SVC_ThresholdTimeMins(4i)"].to_i

m=params[:services][:"SVC_ThresholdTimeMins(5i)"].to_i
s=params[:services][:"SVC_ThresholdTimeMins(6i)"].to_i


        
        t=h.to_s+":"+m.to_s+":"+s.to_s
   
    
	 @services=Service.new(@params['services'])
   if @s!=nil
	        @s1=Service.find_first(["SVC_ServiceID='Y'"])
	        if @s1==nil
	           @services.SVC_ServiceID="Y"
	        else
		         @services.SVC_ServiceID="Z"
	        end
	        
	      else
	           @services.SVC_ServiceID=@services.SVC_ServiceAcronym
	      end
	           @services.save
 when :get
        @services= Service.new
   end
 end
@a=@services. id
 @asd=Service.update(@a,{:waitingforapprova=> '1'})
 #Service.find_by_sql("update services set waitingforapproval ='1' where SVC_ServiceName='#{@services.SVC_ServiceName}'")
 #Service.update(:conditions=>["SVC_ServiceName=?",'#{@services.SVC_ServiceName}'])
   end
z=AdministrationController.new
z.hello()
end
