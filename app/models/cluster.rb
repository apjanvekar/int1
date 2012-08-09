
class Cluster < ActiveRecord::Base
  validates_length_of :CLST_ClusterName,  :maximum => 15, :on => :create, :message=> "^Cluster name should be upto 15 characters."
     validates_length_of :CLST_ClusterName, :maximum=> 15, :on => :update, :message=> "^Cluster name should be upto 15 characters."

  validates_presence_of :CLST_ClusterName, :on => :create, :message => "^Cluster name shouldn't be blank."
    validates_presence_of :CLST_ClusterName, :on => :update, :message => "^Cluster name shouldn't be blank."
    
  validates_presence_of :CLST_RegionID, :on => :create, :message => "^Please first select the zone then region."
    validates_presence_of :CLST_RegionID, :on => :update, :message => "^Please first select the zone then region."
  #validates_presence_of :CLST_ClusterName, :on => :create, :message => "Cluster Name shouldn't be blank"

  validates_uniqueness_of :CLST_ClusterName, :on => :create,  :message => "^Cluster name is already exist."
     validates_uniqueness_of :CLST_ClusterName, :on => :update,  :message => "^Cluster name is already exist."
     
  validates_format_of :CLST_ClusterName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^Cluster Name cannot contain special symbols.",
  :on => :create
  
    validates_format_of :CLST_ClusterName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^Cluster name cannot contain special symbols.",
  :on => :update
  #validates_presence_of :CLST_RegionID, :on => :create, :message => "Please select a region name"
end

=begin
class Cluster < ActiveRecord::Base
     validates_length_of :CLST_ClusterName,  :maximum => 15, :on => :create, :message=> "^Cluster Name should be upto 15 characters."
     validates_length_of :CLST_ClusterName, :maximum=> 15, :on => :update, :message=> "^Cluster Name should be upto 15 characters."

     validates_presence_of :CLST_ClusterName, :on => :create, :message => "^Cluster Name should not be blank"
     validates_presence_of :CLST_ClusterName, :on => :update, :message => "^Cluster Name should not be blank"
     
     validates_presence_of :CLST_RegionID, :on => :create, :message => "^Please select the Zone having Region"
     validates_presence_of :CLST_RegionID, :on => :update, :message => "^Please select the Zone having Region"
     
     #validates_presence_of :CLST_ClusterName, :on => :create, :message => "Cluster Name shouldn't be blank"

     validates_uniqueness_of :CLST_ClusterName, :on => :create,  :message => "^Cluster Name is already exist."
     validates_uniqueness_of :CLST_ClusterName, :on => :update,  :message => "^Cluster Name is already exist."
=begin
     validates_format_of :CLST_ClusterName,
        :with => /^[A-Za-z .]*\z/ ,
        :message => "^Cluster Name cannot contain Special Symbols and numeric values only ",
        :on => :create
  
     validates_format_of :CLST_ClusterName,
        :with => /^[A-Za-z .]*\z/ ,
        :message => "^Cluster Name cannot contain Special Symbols and numeric values only",
        :on => :update
  #validates_presence_of :CLST_RegionID, :on => :create, :message => "Please select a region name"

   
   
     validates_format_of :CLST_ClusterName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^ Cluster Name should not contain special characters."
     validates_format_of :CLST_ClusterName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^ Cluster Name should not contain special characters."
                              
     validates_format_of :CLST_ClusterName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^ Cluster Name must start with Alphabets."
     validates_format_of :CLST_ClusterName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^ Cluster Name must start with Alphabets."                         
end
=end