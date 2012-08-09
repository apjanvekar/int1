=begin
class NonSTPReason < ActiveRecord::Base
   validates_presence_of:NSTP_NonSTPReason, :on => :create,:message =>"^NonSTPReason cannot be blank"
      validates_presence_of:NSTP_NonSTPReason, :on => :update,:message =>"^NonSTPReason cannot be blank"
      validates_presence_of :NSTP_GroupID, :on => :create, :message =>"^Please Select Group"

 #  validates_presence_of:Group, :message =>"cannot be blank"
 validates_uniqueness_of :NSTP_NonSTPReason, :on => :create, :message => "^Already exist the value which you entered"
 validates_uniqueness_of :NSTP_NonSTPReason, :on => :update, :message => "^Already exist the value which you entered"

validates_format_of :NSTP_NonSTPReason,
                            :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
                            :message =>"^NonSTPReason Cannot contain Special Symbols and White Space",
                            :on => :update
validates_format_of :NSTP_NonSTPReason,
                            :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
                            :message =>"^NonSTPReason Cannot contain Special Symbols and White Space",
                            :on =>:create
end
=end

class NonSTPReason < ActiveRecord::Base
     validates_presence_of:NSTP_NonSTPReason, :on => :create,:message =>"^NonSTPReason cannot be blank"
     validates_presence_of:NSTP_NonSTPReason, :on => :update,:message =>"^NonSTPReason cannot be blank" 
     
     validates_length_of :NSTP_NonSTPReason,:maximum  => 15,  :on => :create,:message =>"^NonSTPReason length should be less then 15"
     validates_length_of :NSTP_NonSTPReason,:maximum  => 15,  :on => :update,:message =>"^NonSTPReason length should be less then 15"
     
     validates_uniqueness_of :NSTP_NonSTPReason, :on => :create, :message => "^Already exist the value which you entered"
     validates_uniqueness_of :NSTP_NonSTPReason, :on => :update, :message => "^Already exist the value which you entered"
    
     validates_format_of :NSTP_NonSTPReason,
                            :with => /^[A-Za-z 0-9.]*\z/ ,
                            :message =>"^NonSTPReason Cannot contain Special Symbols and White Space",
                            :on => :create
     validates_format_of :NSTP_NonSTPReason,
                            :with => /^[A-Za-z 0-9.]*\z/ ,
                            :message =>"^NonSTPReason Cannot contain Special Symbols and White Space",
                            :on =>:update

     
      
     
 #  validates_presence_of:Group, :message =>"cannot be blank"
 

=begin 
     validates_format_of :NSTP_NonSTPReason, :on => :create, 
                              :with => /^\D\w+$/i,
                              :message => "^ NonSTPReason can only contain Alphanumeric value."
     validates_format_of :NSTP_NonSTPReason, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^ NonSTPReason can only contain Alphanumeric value."
=end
     
     validates_presence_of :NSTP_GroupID, :on => :create, :message =>"^Please Select Group"

end
