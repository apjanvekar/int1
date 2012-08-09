
class Zone < ActiveRecord::Base
      has_many :regions
  has_many :clusters
  has_many  :groups
  has_many  :locations
   validates_length_of :ZONE_ZoneName, :maximum  => 15,  :on => :update, :message=> "^Zone name should be upto 15 characters." 
     validates_length_of :ZONE_ZoneName, :maximum => 15, :on => :create,  :message=> "^Zone name should be upto 15 characters."
  validates_presence_of :ZONE_ZoneName, :on => :create,  :message => "^Zone name should not be blank."
  validates_presence_of :ZONE_ZoneName,  :on => :update, :message => "^Zone name should not be blank."

validates_uniqueness_of :ZONE_ZoneName,  :on => :update,  :message => "^Already contain a record for the entered value."
 validates_uniqueness_of :ZONE_ZoneName, :on => :create,   :message => "^Already contain a record for the entered value."

 validates_format_of :ZONE_ZoneName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^Zone name Cannot contain special symbols.",
  :on => :create
  
validates_format_of :ZONE_ZoneName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^Zone name Cannot contain special symbols.",
  :on => :update
  
 end

=begin
class Zone < ActiveRecord::Base
      has_many :regions
  has_many :clusters
  has_many  :groups
  has_many  :locations
     validates_length_of :ZONE_ZoneName, :maximum  => 15,  :on => :update, :message=> "^Zone Name should be upto 15 characters." 
     validates_length_of :ZONE_ZoneName, :maximum => 15, :on => :create,  :message=> "^Zone Name should be upto 15 characters."
     
     validates_presence_of :ZONE_ZoneName, :on => :create,  :message => "^Zone Name shouldn't be blank"
     validates_presence_of :ZONE_ZoneName,  :on => :update, :message => "^Zone Name shouldn't be blank"

     validates_uniqueness_of :ZONE_ZoneName,  :on => :update,  :message => "^Zone Name is already exist"
     validates_uniqueness_of :ZONE_ZoneName, :on => :create,   :message => "^Zone Name is already exist"
 
     validates_format_of :ZONE_ZoneName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^Zone Name should not contain special characters."
     validates_format_of :ZONE_ZoneName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^Zone Name can only contain Alphanumeric value."
     validates_format_of :ZONE_ZoneName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^Zone Name must start with Alphabet."        
      validates_format_of :ZONE_ZoneName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^Zone Name must start with Alphabet."                                 

=begin
 validates_format_of :ZONE_ZoneName,
  :with => /^[A-Za-z .&]*\z/,
  :message => "^ZoneName cannot contain Special Symbols and numeric values only",
  :on => :create
  
validates_format_of :ZONE_ZoneName,
  :with => /^[A-Za-z .&]*\z/,
  :message => "^ZoneName cannot contain Special Symbols and numeric values only",
  :on => :update
 
 end
=end