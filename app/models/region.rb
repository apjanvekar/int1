
class Region < ActiveRecord::Base
  has_many :clusters
  validates_presence_of :REG_RegionName, :on => :create,:message => "^Region name should not be blank."
  validates_presence_of :REG_RegionName, :on => :update,:message => "^Region name should not be blank."
  
  validates_presence_of :REG_ZoneID,:on => :create, :message => "^Please select Zone."
  validates_presence_of :REG_ZoneID,:on => :update, :message => "^Please select Zone."
  
  validates_uniqueness_of :REG_RegionName, :on => :update,:message=> "^Already exist the value which you entered."
    validates_uniqueness_of :REG_RegionName, :on => :create,:message=> "^Already exist the value which you entered."
  #validates_presence_of :REG_RegionName, :on => :update,:message => "Region Name shouldn't be blank"

  validates_format_of :REG_RegionName,
  :with => /^[A-Z a-z 0-9 -.]*\z/,
  :message => "^Region name cannot contain special symbols.",
  :on => :create
  
   validates_format_of :REG_RegionName,
  :with => /^[A-Z a-z 0-9 -.]*\z/,
  :message => "^Region name cannot contain special symbols.",
  :on => :update
  
  
  validates_length_of :REG_RegionName, :maximum  => 15,  :on => :update, :message=> "^Region name should be upto 15 characters." 
     validates_length_of :REG_RegionName, :maximum => 15, :on => :create,  :message=> "^Region name should be upto 15 characters."

end

=begin
class Region < ActiveRecord::Base
  has_many :clusters
     validates_presence_of :REG_RegionName, :on => :create,:message => "^Region Name should not be blank."
     validates_presence_of :REG_RegionName, :on => :update,:message => "^Region Name should not be blank."
     
     validates_length_of :REG_RegionName, :maximum  => 15,  :on => :update, :message=> "^Region Name should be upto 15 characters." 
     validates_length_of :REG_RegionName, :maximum => 15, :on => :create,  :message=> "^Region Name should be upto 15 characters."

     
     validates_presence_of :REG_ZoneID,:on => :create, :message => "^Zone ID should not be blank."
     
     validates_uniqueness_of :REG_RegionName, :on => :update,:message=> "^Region Name is already exist."
     validates_uniqueness_of :REG_RegionName, :on => :create,:message=> "^Region Name is already exist."
     
     #validates_presence_of :REG_RegionName, :on => :update,:message => "Region Name shouldn't be blank"
=begin
     validates_format_of :REG_RegionName,
      :with => /^[A-Za-z .]*\z/,
      :message => "^RegionName cannot contain Special Symbols and numeric values only ",
      :on => :create
  
     validates_format_of :REG_RegionName,
      :with => /^[A-Za-z .]*\z/,
      :message => "^RegionName cannot contain Special Symbols and numeric values only ",
      :on => :update
     


     
     validates_format_of :REG_RegionName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^Region Name should not contain special characters."
     validates_format_of :REG_RegionName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^Region Name should not contain special characters."
     
     validates_format_of :REG_RegionName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^Region Name must start with Alphabets."
     validates_format_of :REG_RegionName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^Region Name must start with Alphabets."
end
=end