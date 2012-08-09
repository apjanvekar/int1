=begin
class Dqmvendor < ActiveRecord::Base
  validates_presence_of :VND_VendorName, :on => :create, :message=>"^Please enter Vendor Name"
     validates_uniqueness_of :VND_VendorName, :on => :create, :message => "^Already exist the value which you entered for Vendor Name"
 validates_uniqueness_of :VND_VendorName, :on => :update, :message => "^Already exist the value which you entered for Vendor Name"
  validates_presence_of :VND_VendorName, :on => :update, :message=>"^Please enter Vendor name" 
   validates_presence_of :VND_Telephone, :on => :update, :message=>"^Please enter value for Telephone no" 
   validates_presence_of :VND_Fax, :on => :update, :message=>"^Please enter value for Fax no" 
    validates_presence_of :VND_Address, :on => :create, :message=>"^Please enter Vendor Address" 
    validates_presence_of :VND_Address, :on => :update, :message=>"^Please enter Vendor Address" 
    validates_presence_of :VND_ContactPersonName, :on => :update, :message=>"^Please enter Vendor Contact person Name" 
    validates_presence_of :VND_ContactPersonName, :on => :create, :message=>"^Please enter Vendor Contact person Name" 
    validates_length_of :VND_Telephone, :minimum => 8, :on => :create, :message=> "^ Telephone number should be minimum 9 digits"
    validates_length_of :VND_Telephone, :minimum=> 8, :on => :update, :message=> "^Telephone number should be minimum 9 digits"
    validates_length_of :VND_Fax, :minimum => 8, :on => :create, :message=> "^ Fax number should be minimum 8 digits"
    validates_length_of :VND_Fax, :minimum=> 8, :on => :update, :message=> "^ Fax number should be minimum 8 digits"
validates_length_of :VND_Telephone, :maximum => 12, :on => :create, :message=> "^ Telephone number should be maximum 11 digits"
    validates_length_of :VND_Telephone, :maximum=> 12, :on => :update, :message=> "^Telephone number should be maximum 11 digits"
    validates_length_of :VND_Fax, :maximum => 12, :on => :create, :message=> "^ Fax number should be maximum 12 digits"
    validates_length_of :VND_Fax, :maximum => 12, :on => :update, :message=> "^Fax number should be maximum 12 digits"
    validates_format_of :VND_VendorName,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on =>:update,:message => "^VendorName Cannot contain Special Symbols, Numbers"
  validates_format_of :VND_VendorName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^VendorName Cannot contain Special Symbols, Numbers",
    :on=>:create
validates_format_of :VND_VendorName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^VendorName Cannot contain Special Symbols, Numbers",
    :on=>:update
       validates_uniqueness_of :VND_ContactEmailID, :on => :create, :message => "^Already exist the value which you entered for emailid"
       validates_uniqueness_of :VND_ContactEmailID, :on => :update, :message => "^Already exist the value which you entered for emailid"

   # validates_format_of :VND_VendorName,:with => /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/,    :message => "Enter proper IP address",    :on =>:create
    
  validates_presence_of :VND_ContactEmailID, 
  :message => "^Please enter Email ID",
  :on =>:create
  
  validates_format_of :VND_ContactEmailID,
:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
:message => "^Please enter valid Email ID"

validates_numericality_of :VND_Telephone,:on => :create, :message => "^Please enter numeric value for telephone no" 

validates_numericality_of :VND_Fax,:on => :create, :message => "^Please enter numeric value for Fax no" 
end
=end

class Dqmvendor < ActiveRecord::Base
     validates_presence_of :VND_VendorName,:on => :create, :message=>"^Please enter Vendor Name"
     validates_presence_of :VND_VendorName,:on => :update, :message=>"^Please enter Vendor Name"
     
     validates_uniqueness_of :VND_VendorName, :on => :create, :message => "^Vendor Name is already exist."
     validates_uniqueness_of :VND_VendorName, :on => :update, :message => "^Vendor Name is already exist."

     validates_length_of :VND_VendorName,:maximum  => 15,:on => :create, :message=>"^Vendor Name should be upto 15 characters."
     validates_length_of :VND_VendorName,:maximum  => 15,:on => :update, :message=>"^Vendor Name should be upto 15 characters."
  
     validates_format_of :VND_VendorName,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on=>:create,:message => "^Vendor Name should not contain special characters."
     validates_format_of :VND_VendorName,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on =>:update,:message => "^Vendor Name should not contain special characters."
=begin   
     validates_format_of :VND_VendorName,:with => /^\D\w+$/i ,:on=>:create,:message => "^Vendor Name must start with Alphabets."
     validates_format_of :VND_VendorName,:with => /^\D\w+$/i ,:on =>:update,:message => "^Vendor Name must start with Alphabets."

=end
     
     validates_presence_of :VND_Address,:on => :create, :message=>"^Please enter Vendor Address"
     validates_presence_of :VND_Address,:on => :update, :message=>"^Please enter Vendor Address"
     
     #validates_uniqueness_of :VND_Address, :on => :create, :message => "^Vendor Address is already exist."
     #validates_uniqueness_of :VND_Address, :on => :update, :message => "^Vendor Address is already exist."

     #validates_length_of :VND_Address,:maximum  => 15,:on => :create, :message=>"^Vendor Address length should be less then 15"
     #validates_length_of :VND_Address,:maximum  => 15,:on => :update, :message=>"^Vendor Address length should be less then 15"
     

     #validates_format_of :VND_Address,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on=>:create,:message => "^Vendor Address Cannot contain Special Symbols"
     #validates_format_of :VND_Address,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on =>:update,:message => "^Vendor Address Cannot contain Special Symbols"
     
=begin
     validates_format_of :VND_Address,:with => /^[A-Za-z 0-9.]*\z/ ,:on=>:create,:message => "^Vendor Address Cannot contain Special Symbols, Numbers"
     validates_format_of :VND_Address,:with => /^[A-Za-z 0-9 .]*\z/ ,:on =>:update,:message => "^VendorAddress Cannot contain Special Symbols, Numbers"
=end

    
     #validates_presence_of :VND_ContactPersonName,:on => :create, :message=>"^Please enter ContactPersonName"
     #validates_presence_of :VND_ContactPersonName,:on => :update, :message=>"^Please enter ContactPersonName"

     validates_length_of :VND_ContactPersonName,:maximum  => 15,:on => :create, :message=>"^Contact Person Name length should be less then 15"
     validates_length_of :VND_ContactPersonName,:maximum  => 15,:on => :update, :message=>"^Contact Person Name length should be less then 15"
     
     validates_format_of :VND_ContactPersonName,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on=>:create,:message => "^Contact Person Name should not contain special characters."
     validates_format_of :VND_ContactPersonName,:with => /^[A-Z a-z 0-9 -.]*\z/ ,:on =>:update,:message => "^Contact Person Name should not contain special characters."
=begin
     validates_format_of :VND_ContactPersonName,:with => /^\D\w+$/i ,:on=>:create,:message => "^Contact Person Name must start with Alphabets."
     validates_format_of :VND_ContactPersonName,:with => /^\D\w+$/i ,:on =>:update,:message => "^Contact Person Name must start with Alphabets."
=end

     validates_uniqueness_of :VND_ContactPersonName, :on => :create, :message => "^ContactPersonName is already exist."
     validates_uniqueness_of :VND_ContactPersonName, :on => :update, :message => "^ContactPersonName is already exist."
  

     validates_format_of :VND_ContactEmailID,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:message => "^Please enter valid Vendor Email ID"

     #validates_uniqueness_of :VND_ContactEmailID, :on => :create, :message => "^EmailID is already exist."
     #validates_uniqueness_of :VND_ContactEmailID, :on => :update, :message => "^EmailID is already exist."


     #validates_presence_of :VND_Telephone,:on => :create, :message=>"^Please enter Telephone"
     #validates_presence_of :VND_Telephone,:on => :update, :message=>"^Please enter Telephone"

     validates_length_of :VND_Telephone,:maximum  => 15,:on => :create, :message=>"^Vendor Phone No. should be upto 15 numbers"
     validates_length_of :VND_Telephone,:maximum  => 15,:on => :update, :message=>"^Vendor Phone No. should be upto 15 numbers"
     
     validates_numericality_of :VND_Telephone,:on => :create, :message => "^Please enter numeric value for Vendor Phone No." 
     validates_numericality_of :VND_Telephone,:on => :update, :message => "^Please enter numeric value for Vendor Phone No." 

     validates_uniqueness_of :VND_Telephone, :on => :create, :message => "^Vendor Phone No is already exist."
     validates_uniqueness_of :VND_Telephone, :on => :update, :message => "^Vendor Phone No is already exist."

     #validates_length_of :VND_Telephone, :minimum => 8, :on => :create, :message=> "^Vendor Phone No. should be minimum 8 digits"
     #validates_length_of :VND_Telephone, :minimum=> 8, :on => :update, :message=> "^Vendor Phone No. should be minimum 8 digits"
     
     
     
     #validates_presence_of :VND_Fax,:on => :create, :message=>"^Please enter Fax"
     #validates_presence_of :VND_Fax,:on => :update, :message=>"^Please enter Fax"
     
     validates_uniqueness_of :VND_Fax, :on => :create, :message => "^Fax is already exist."
     validates_uniqueness_of :VND_Fax, :on => :update, :message => "^Fax is already exist."

     #validates_length_of :VND_Fax,:maximum  => 8,:on => :create, :message=>"^Fax Number should be greater than 8"
     #validates_length_of :VND_Fax,:maximum  => 8,:on => :update, :message=>"^Fax Number should be greater than 8"
     
     validates_length_of :VND_Fax, :maximum => 12, :on => :create, :message=> "^ Vendor Fax No. should be maximum 12 digits"
     validates_length_of :VND_Fax, :maximum => 12, :on => :update, :message=> "^ Vendor Fax No. should be maximum 12 digits"
     
     validates_numericality_of :VND_Fax,:on => :create, :message => "^Please enter numeric value for Vendor Fax No" 
     validates_numericality_of :VND_Fax,:on => :update, :message => "^Please enter numeric value for Vendor Fax No" 


    # validates_format_of :VND_VendorName,:with => /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/,    :message => "Enter proper IP address",    :on =>:create
    
 end
