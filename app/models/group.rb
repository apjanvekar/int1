=begin
class Group < ActiveRecord::Base
    validates_length_of :GRP_GroupName, :maximum=> 50, :on => :create, :message=> "^Group Name length should be less then 50"
  validates_presence_of :GRP_GroupName, :on => :create, :message => "^Group Name shouldn't be blank"
    validates_presence_of :GRP_GroupName, :on => :update, :message => "^Group Name shouldn't be blank"
  validates_presence_of :GRP_GroupDescription, :on => :create, :message => "^GroupDescription shouldn't be blank"
    validates_presence_of :GRP_GroupDescription, :on => :update, :message => "^GroupDescription shouldn't be blank"
    validates_length_of :GRP_GroupName, :maximum=> 50, :on => :update, :message=> "^Group Name length should be less then 50"

  validates_uniqueness_of :GRP_GroupDescription, :on => :create,  :message => "^Already contain a record for the entered value of GroupDescription"
    validates_uniqueness_of :GRP_GroupDescription, :on => :update,  :message => "^Already contain a record for the entered value of GroupDescription"
  validates_uniqueness_of :GRP_GroupName, :on => :create,  :message => "^Already contain a record for the entered value of GroupName"
    validates_uniqueness_of :GRP_GroupName, :on => :update,  :message => "^Already contain a record for the entered value of GroupName"

  validates_format_of :GRP_GroupName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^GroupName Cannot contain Special Symbols and Numbers",
  :on => :create
  
   validates_format_of :GRP_GroupName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^GroupName Cannot contain Special Symbols and Numbers",
  :on => :update
end
=end

class Group < ActiveRecord::Base
     validates_length_of :GRP_GroupName, :maximum=> 15, :on => :create, :message=> "^Group name should be upto 15 characters."
     validates_length_of :GRP_GroupName, :maximum=> 15, :on => :update, :message=> "^Group Name should be upto 15 characters."
     
     validates_presence_of :GRP_GroupName, :on => :create, :message => "^Group Name shouldn't be blank."
     validates_presence_of :GRP_GroupName, :on => :update, :message => "^Group Name shouldn't be blank."
     
     validates_presence_of :GRP_GroupDescription, :on => :create, :message => "^Group Description shouldn't be blank."
     validates_presence_of :GRP_GroupDescription, :on => :update, :message => "^Group Description shouldn't be blank."
   

     validates_uniqueness_of :GRP_GroupDescription, :on => :create,  :message => "^Group Description is already exist."
     validates_uniqueness_of :GRP_GroupDescription, :on => :update,  :message => "^Group Description is already exist."
     
     validates_uniqueness_of :GRP_GroupName, :on => :create,  :message => "^Group Name is already exist."
     validates_uniqueness_of :GRP_GroupName, :on => :update,  :message => "^Group Name is already exist."
=begin
     validates_format_of :GRP_GroupName,
        :with => /^[A-Za-z .]*\z/ ,
        :message => "^GroupName cannot contain Special Symbols and Numeric values only",
        :on => :create
  
     validates_format_of :GRP_GroupName,
        :with => /^[A-Za-z .]*\z/ ,
        :message => "^GroupName cannot contain Special Symbols and Numeric values only",
        :on => :update


     validates_format_of :GRP_GroupName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^ Group Name should not contain special characters."
     validates_format_of :GRP_GroupName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^ Group Name should not contain special characters."
                              
     validates_format_of :GRP_GroupName, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^ Group Name must start with Alphabet."
     validates_format_of :GRP_GroupName, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^ Group Name must start with Alphabet."                        
=end


validates_format_of :GRP_GroupName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^GroupName Cannot contain Special Symbols and Numbers",
  :on => :create
  
   validates_format_of :GRP_GroupName,
  :with => /^[A-Z a-z 0-9 -.]*\z/ ,
  :message => "^GroupName Cannot contain Special Symbols and Numbers",
  :on => :update
end
