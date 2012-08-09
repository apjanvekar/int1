class CarddetailsController < ApplicationController
layout 'sidenew'
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @carddetail_pages, @carddetails = paginate :carddetails, :per_page => 10
  end

  def show
    @carddetail = Carddetail.find(params[:id])
  end

  def new
    @carddetail = Carddetail.new
  end

  def create
    @carddetail = Carddetail.new(params[:carddetail])
    require 'mysql'
    mysql = Mysql.init() 
    if @carddetail.save
      @ip=Location.find_by_sql("select LOC_SoleID,LOC_DQM_IPAddress from locations where LOC_IsActive=1")
                     
                          for item in @ip
                          
                                d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{item.LOC_SoleID}' and EXP_Date='#{d}' and EXP_MasterName='carddetailsbkp'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end                      
                            begin
                                 
                                  @ipadd=item.LOC_DQM_IPAddress
                                  mysql.connect(@ipadd,'stlqms4icici','stlqms4icici')
                                  mysql.select_db('DQMS_development')
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
          #mysql.query("insert into carddetailsbkp(id,bin,product,priority,downloadeddate) values(#{id},'"+ bin +"','"+ product +"','"+ priority+"','#{downloadeddate}')")
          
        end
          @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=item.LOC_SoleID
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{item.LOC_SoleID}'")
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
          @dataexp.EXP_LocationID=item.LOC_SoleID
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{item.LOC_SoleID}'")
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
      
    end      
    
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end
 def canceladd
 render :update do |page|
   
     page.redirect_to url_for( :controller=>'carddetails', :action =>'list')
  end
    
  end
  def edit
    @carddetail = Carddetail.find(params[:id])
  end

  def update
    @carddetail = Carddetail.find(params[:id])
    #puts params[:carddetails][:priority]
    
    require 'mysql'
    mysql = Mysql.init()
    if @carddetail.update_attributes(params[:carddetail])
     @ip=Location.find_by_sql("select LOC_SoleID,LOC_DQM_IPAddress from locations where LOC_IsActive=1")
                      
                          for item in @ip
                           
                             d=Date.today
        p=DataExportStatus.find_by_sql("select id from data_export_statuses where EXP_LocationID='#{item.LOC_SoleID}' and EXP_Date='#{d}' and EXP_MasterName='carddetailsbkp'")
        for it in p
        DataExportStatus.find(it.id).destroy
        end                                              
                            begin
                                 
                                  @ipadd=item.LOC_DQM_IPAddress
                                  mysql.connect(@ipadd,'stlqms4icici','stlqms4icici')
                                  mysql.select_db('DQMS_development')
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
          #mysql.query("insert into carddetailsbkp(id,bin,product,priority,downloadeddate) values(#{id},'"+ bin +"','"+ product +"','"+ priority+"','#{downloadeddate}')")
          
        end
 @dataexp=DataExportStatus.new
          @dataexp.EXP_LocationID=item.LOC_SoleID
           @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{item.LOC_SoleID}'")
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
          @dataexp.EXP_LocationID=item.LOC_SoleID
          @e=Location.find_by_sql("select LOC_ClusterID from locations where LOC_SoleID='#{item.LOC_SoleID}'")
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
      
end   
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def delete
    Carddetail.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
