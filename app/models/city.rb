class City < ActiveRecord::Base  
    validates_presence_of :cityname, :on =>:create,:message =>"^City name should not be blank."
     validates_presence_of :cityname, :on => :update,:message =>"^City name should not be blank."
     validates_presence_of :LOC_ClusterID, :on =>:create,:message => "^Please first select zone then region then cluster name." 
     validates_presence_of :LOC_ClusterID, :on =>:update,:message => "^Please first select zone then region then cluster name." 
     
     validates_format_of :cityname,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^Cluster name cannot contain special symbols.",
  :on => :create
  
    validates_format_of :cityname,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^Cluster name cannot contain special symbols.",
  :on => :update
     
end
