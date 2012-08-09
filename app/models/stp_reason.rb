=begin
class STPReason < ActiveRecord::Base
  validates_presence_of :STP_STPReason, :on =>:create, :message =>"^STPReason shouldn't be blank"
   validates_uniqueness_of :STP_STPReason, :on => :create, :message => "^Already exist the value which you entered for STPReason"

  validates_presence_of :STP_ServiceID, :on => :create, :message => "^Please select Services "
    #validates_presence_of :STP_ServiceID, :on => :update, :message => "Services shouldn't be blank"

validates_presence_of :STP_STPReason, :on =>:update, :message =>"^STPReason shouldn't be blank"

 # validates_presence_of :Group, :message =>"cannot be blank"
#  validates_presence_of :STP_STPReason, :on =>:update, :message =>"STPReason shouldn't be blank"
 validates_uniqueness_of :STP_STPReason, :on => :update, :message => "^Already exist the value which you entered for STPReason,"

#validates_format_of :STP_STPReason,
 #                           :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
  #                          :message =>"^STPReason Cannot contain Special Symbols and White Space",
   #                         :on =>:create
                            
 #validates_format_of :STP_STPReason,
   #                         :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
   #                         :message =>"^STPReason Cannot contain Special Symbols and White Space",
    #                       :on => :update
                            
end
=end

class STPReason < ActiveRecord::Base
  validates_presence_of :STP_STPReason, :on =>:create, :message =>"^STPReason shouldn't be blank"
   validates_uniqueness_of :STP_STPReason, :on => :create, :message => "^Already exist the value which you entered for STPReason"

  validates_length_of :STP_STPReason,:maximum  => 30, :on => :create, :message => "^STP Reason length should be less then 15"
    validates_length_of :STP_STPReason,:maximum  => 30, :on => :update, :message => "^STP Reason length should be less then 15"

  validates_presence_of :STP_ServiceID, :on => :create, :message => "^Please select Services "
    #validates_presence_of :STP_ServiceID, :on => :update, :message => "Services shouldn't be blank"

validates_presence_of :STP_STPReason, :on =>:update, :message =>"^STPReason shouldn't be blank"

 # validates_presence_of :Group, :message =>"cannot be blank"
#  validates_presence_of :STP_STPReason, :on =>:update, :message =>"STPReason shouldn't be blank"
 validates_uniqueness_of :STP_STPReason, :on => :update, :message => "^Already exist the value which you entered for STPReason,"

validates_format_of :STP_STPReason,
                           :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
                            :message =>"^STPReason Cannot contain Special Symbols and White Space",
                            :on =>:create
                            
 validates_format_of :STP_STPReason,
                           :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
                            :message =>"^STPReason Cannot contain Special Symbols and White Space",
                          :on => :update
    
     #validates_format_of :STP_STPReason, :on => :create, 
                        #      :with => /^\D\w+$/i,
                           #   :message => "^ STPReason can only contain Alphanumeric value."
     #validates_format_of :STP_STPReason, :on => :update, 
                            #  :with => /^\D\w+$/i,
                            #  :message => "^ STPReason can only contain Alphanumeric value."
    
         
end
