=begin
class Location < ActiveRecord::Base

validates_presence_of :LOC_SoleID, :on => :create, :message => "^Please enter the Location Sole ID" 
validates_presence_of :LOC_DQMVendorID, :on => :create, :message => "^Please Select DQMVendor"
validates_uniqueness_of :LOC_SoleID,:on => :create,:message => "^Please enter unique value for SoleID"
  validates_presence_of :LOC_SoleID, :on => :update, :message => "^Please enter the Location SoleID" 
validates_uniqueness_of :LOC_SoleID,:on => :update, :message => "^Please enter unique value for SoleID"
validates_uniqueness_of :LOC_BranchName,:on => :create,:message => "^Please enter unique value for BranchName"
validates_uniqueness_of :LOC_BranchName,:on => :update,:message => "^Please enter unique value for BranchName"

validates_presence_of :LOC_BranchName,:on => :create,:message => "^Please enter the Branch Name"
validates_presence_of :LOC_BranchName,:on => :update,:message => "^Please enter the Branch Name"
validates_format_of :LOC_BranchName,
  :with => /^[A-Z a-z 0-9]*\z/,
  :message => "^BranchName Cannot contain Special Symbols and digits",
  :on => :create
#validates_format_of :LOC_SoleID,  :with => /^[A-Z a-z 0-9]*\z/,  :message => "^SoleID Cannot contain Special Symbols and digits",  :on => :update
#validates_format_of :LOC_SoleID,  :with => /^[A-Z a-z 0-9 -.]*\z/,  :message => "^SoleID Cannot contain Special Symbols and digits",  :on => :create
  validates_format_of :LOC_BranchName,
  :with => /^[A-Z a-z 0-9 -.]*\z/,
  :message => "^BranchName Cannot contain Special Symbols and digits",
  :on => :update
  
 validates_presence_of :LOC_ClusterID, :message => "^Please First Select Zone Then Region Then Cluster Name"
validates_presence_of :LOC_GroupID, :message => "^Please select Group Name"
  
  validates_presence_of :LOC_NoOfEmployees,:on => :create, :message => "^Please Enter No of Employees"
  validates_numericality_of :LOC_NoOfEmployees, :on => :create, :message => "^Enter numeric value for No of Employee"

    validates_presence_of :LOC_NoOfEmployees,:on => :update, :message => "^Please Enter No of Employees"
  validates_numericality_of :LOC_NoOfEmployees, :on => :update, :message => "^Enter numeric value for No of Employee"
  
     #validates_length_of :LOC_NoOfEmployees, :within => 1..6, :on => :create, :message => "No of Employee value should be less then 7"
 #validates_length_of :LOC_NoOfEmployees, :within => 1..6,:on => :update , :message => "No of Employee value should be less then 7"

    validates_presence_of :LOC_DQM_IPAddress, :on => :update,:message => "^Enter IP address"
    validates_uniqueness_of :LOC_DQM_IPAddress, :on => :create,:message => "^Please enter unique IP address"
    validates_uniqueness_of :LOC_DQM_IPAddress, :on => :update,:message => "^Please enter unique IP address"
    validates_length_of :LOC_DQM_IPAddress, :minimum => 7, :on => :create, :message=> "^ Please enter proper IP address "
    validates_length_of :LOC_DQM_IPAddress,  :minimum => 7, :on => :update, :message=> "^Please enter proper IP address "

    validates_length_of :LOC_DQM_IPAddress, :maximum=> 15, :on => :create, :message=> "^IP address should be maximum 15 digits"
    validates_length_of :LOC_DQM_IPAddress,  :maximum => 15, :on => :update, :message=> "^IP address should be maximum 15 digits"

  
  validates_presence_of :LOC_DQM_IPAddress, :on => :create,:message => "^Enter IP address"
  validates_format_of :LOC_DQM_IPAddress,
  :with => /^[0-9.]*\z/,
  :message => "^DQMIPAddress Cannot contain Special Symbols,White Space and alphabates",
  :on => :create
  validates_format_of :LOC_DQM_IPAddress,
  :with => /^[0-9.]*\z/,
  :message => "^DQM-IPAddressCannot contain Special Symbols,White Space and alphabates",
  :on => :update
  
  
  
  #validates_length_of :CLST_ClusterName, :within => 1..15, :on => :create, :message=> "Cluster Name length should be less then 16"
  #validates_presence_of :CLST_ClusterName, :on => :create, :message => "Cluster Name shouldn't be blank"
  #validates_uniqueness_of :CLST_ClusterName, :on => :create,  :message => "Already contain a record for the entered value"
  #validates_format_of :CLST_ClusterName,
  #:with => /^[A-Za-z0-9-]*\z/,
  #:message => "Cannot contain Special Symbols,White Space",
  #:on => :create
  #validates_presence_of :CLST_RegionID, :on => :create, :message => "Please select a region name"
end
=end

class Location < ActiveRecord::Base

     validates_presence_of :LOC_SoleID, :on => :create, :message => "^Please enter the Branch Sole ID" 
     validates_presence_of :LOC_SoleID, :on => :update, :message => "^Please enter the Branch Sole ID" 
     
     validates_length_of :LOC_SoleID,:maximum  => 15,:on => :create, :message=>"^Location SoleID length should be less then 15"
     validates_length_of :LOC_SoleID,:maximum  => 15,:on => :update, :message=>"^Location SoleID length should be less then 15"

     validates_uniqueness_of :LOC_SoleID,:on => :create,:message => "^Please enter unique value for SoleID"
     validates_uniqueness_of :LOC_SoleID,:on => :update,:message => "^Please enter unique value for SoleID"

     validates_format_of :LOC_SoleID,:with =>  /^[A-Z a-z 0-9]*\z/,:on => :create,:message => "^Branch Sole ID cannot contain special symbols and digits"
     validates_format_of :LOC_SoleID,:with =>  /^[A-Z a-z 0-9]*\z/,:on => :update,:message => "^Branch Sole ID cannot contain special symbols and digits"
     

     validates_presence_of :LOC_BranchName, :on => :create, :message => "^Please enter the BranchName" 
     validates_presence_of :LOC_BranchName, :on => :update, :message => "^Please enter the BranchName" 
     
     validates_length_of :LOC_SoleID,:maximum  => 15,:on => :create, :message=>"^BranchName length should be less then 15"
     validates_length_of :LOC_SoleID,:maximum  => 15,:on => :update, :message=>"^BranchName length should be less then 15"

     validates_uniqueness_of :LOC_BranchName,:on => :create,:message => "^Please enter unique value for BranchName"
     validates_uniqueness_of :LOC_BranchName,:on => :update,:message => "^Please enter unique value for BranchName"

     validates_format_of :LOC_BranchName,:with => /^[A-Z a-z 0-9]*\z/,:on => :create,:message => "^BranchName cannot contain special symbols"
     validates_format_of :LOC_BranchName,:with =>  /^[A-Z a-z 0-9]*\z/,:on => :update,:message => "^BranchName cannot contain special symbols"

     validates_presence_of :LOC_CityID, :on => :create, :message => "^Please first select zone,region,cluster then city name." 
     validates_presence_of :LOC_CityID, :on => :update, :message => "^Please first select zone,region,cluster then city name." 
     
     validates_presence_of :LOC_DQMVendorID, :on => :create, :message => "^Please Select DQMVendor"
     validates_presence_of :LOC_DQMVendorID, :on => :update, :message => "^Please Select DQMVendor"
 
     validates_presence_of :LOC_NoOfEmployees, :on => :create, :message => "^Please enter the No of Employee" 
     validates_presence_of :LOC_NoOfEmployees, :on => :update, :message => "^Please enter the No of Employee" 
     
     validates_numericality_of :LOC_NoOfEmployees, :on => :create, :message => "^Enter numeric value for No of Employee"
     validates_numericality_of :LOC_NoOfEmployees, :on => :update, :message => "^Enter numeric value for No of Employee"
    
     validates_length_of :LOC_NoOfEmployees,:maximum  => 10,:on => :create, :message=>"^No of Employee length should be less then 10"
     validates_length_of :LOC_NoOfEmployees,:maximum  => 10,:on => :update, :message=>"^No of Employee length should be less then 10"
   
     validates_uniqueness_of :LOC_NoOfEmployees,:on => :create,:message => "^Please enter unique value for No Of Employees"
     validates_uniqueness_of :LOC_NoOfEmployees,:on => :update,:message => "^Please enter unique value for No Of Employees"

     validates_format_of :LOC_DQM_IPAddress,
     :with =>/ ((([0-9a-fA-F]+:){7}[0-9a-fA-F]+)|(([0-9a-fA-F]+:)*[0-9a-fA-F]+)?::(([0-9a-fA-F]+:)*[0-9a-fA-F]+)?)|((25[0-5]|2[0-4][\d]|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3})/, :message => "^IP Address should be in this format of 0.0.0.0",
     :on => :create

      validates_format_of :LOC_DQM_IPAddress,
     :with =>/ ((([0-9a-fA-F]+:){7}[0-9a-fA-F]+)|(([0-9a-fA-F]+:)*[0-9a-fA-F]+)?::(([0-9a-fA-F]+:)*[0-9a-fA-F]+)?)|((25[0-5]|2[0-4][\d]|[0-1]?\d?\d)(\.(25[0-5]|2[0-4]\d|[0-1]?\d?\d)){3})/, :message => "^IP Address should be in this format of 0.0.0.0",
     :on => :update
     
     validates_length_of :LOC_DQM_IPAddress, :maximum=> 15, :on => :create, :message=> "^IP address should be maximum 15 digits"
     validates_length_of :LOC_DQM_IPAddress,  :maximum => 15, :on => :update, :message=> "^IP address should be maximum 15 digits"
     
     validates_uniqueness_of :LOC_DQM_IPAddress,:on => :create,:message => "^Please enter unique value for IPAddress"
     validates_uniqueness_of :LOC_DQM_IPAddress,:on => :update,:message => "^Please enter unique value for IPAddress"

     validates_presence_of :LOC_GroupID,:on => :create, :message => "^Please select group name"
     validates_presence_of :LOC_GroupID,:on => :update, :message => "^Please select group name"

     validates_length_of :LOC_DQM_IPAddress, :minimum => 7, :on => :create, :message=> "^ Please enter proper IP address "
     validates_length_of :LOC_DQM_IPAddress,  :minimum => 7, :on => :update, :message=> "^Please enter proper IP address "
     
     validates_length_of :LOC_DQM_IPAddress, :maximum=> 15, :on => :create, :message=> "^IP address should be maximum 15 digits"
     validates_length_of :LOC_DQM_IPAddress,  :maximum => 15, :on => :update, :message=> "^IP address should be maximum 15 digits"

 end
