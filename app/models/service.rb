=begin
class Service < ActiveRecord::Base

   validates_presence_of :SVC_ServiceName,  :on =>:create,:message =>"^Service name shouldn't be blank"
   validates_presence_of :SVC_ServiceName, :on => :update,:message =>"^Service name shouldn't be blank"
   
   #validates_presence_of :SVC_ThresholdTimeMins, :on =>:create, :message =>"^ ThresholdTimeMins shouldn't be blank"
   validates_presence_of :SVC_ButtonNo, :on =>:create,:message =>"^ButtonNo shouldn't be blank"
   
   validates_presence_of :SVC_ServiceAcronym, :on =>:create,:message  =>"^ServiceAcronym shouldn't be blank"
   
   validates_presence_of :SVC_Priority,:on =>:create, :message =>"^Priority shouldn't be blank"
   
 validates_uniqueness_of :SVC_ServiceName, :on =>:create,  :message => "^Already contain a record for the entered value of ServiceName"
 
 validates_uniqueness_of :SVC_ButtonNo, :on =>:create, :message => "^Already contain a record for the entered value of ButtonNo"
 
 #validates_uniqueness_of :SVC_ServiceAcronym, :on => :update,  :message => "Already contain a record for the entered value"
  validates_presence_of :SVC_ThresholdTimeMins, :on => :update, :message =>"^ThresholdTimeMins shouldn't be blank"
  
   validates_presence_of :SVC_ServiceAcronym, :on => :update,:message  =>"^ServiceAcronym shouldn't be blank"
   
   validates_presence_of :SVC_Priority,:on => :update, :message =>"^Priority shouldn't be blank"
   
 validates_uniqueness_of :SVC_ServiceName, :on => :update,  :message => "^Already contain a record for the entered value of ServiceName"
 #validates_uniqueness_of :SVC_ServiceAcronym, :on =>:create,  :message => "Already contain a record for the entered value"
#validates_numericality_of :SVC_ThresholdTimeMins, :on => :update,:message =>"^ThresholdTime should be numeric value"

  #validates_numericality_of :SVC_ThresholdTimeMins, :on =>:create,:message =>"^ThresholdTime should be numeric value"
  validates_numericality_of :SVC_ButtonNo ,:on => :create,:message =>"^ButtonNo should be numeric value"

validates_numericality_of :SVC_ButtonNo ,:on => :update,:message =>"^ButtonNo should be numeric value"
  validates_presence_of :SVC_GroupID, :on => :create, :message =>"^ Please select Group Name"

validates_numericality_of :SVC_Priority, :on =>:create,:message =>"^Priority should be numeric value"
validates_numericality_of :SVC_Priority,:on => :update,:message =>"^Priority should be numeric value"
#validates_length_of :SVC_IsActive, :maximum =>1, :message=>"Type only Y or N"
#validates_format_of :SVC_ServiceName, :with =>/^[A-Z a-z 0-9 -/.]*\z/ , :message =>"^ServiceName Cannot contain Special Symbols and White Space",:on =>:create
#validates_format_of :SVC_ServiceName,:with =>/^[A-Z a-z 0-9 -/.]*\z/ , :message =>"^ServiceName Cannot contain Special Symbols and White Space",:on => :update
                         
validates_format_of :SVC_ServiceAcronym,
                            :with =>/^[A-Z a-z -]*\z/ ,
                            :message =>"^ServiceAcronym Only alphabetical value",
                            :on =>:create
                      
  validates_format_of :SVC_ServiceAcronym,
                            :with =>/^[A-Z a-z -]*\z/ ,
                            :message =>"^ServiceAcronym Only alphabetical value",
                            :on => :update                          
end
=begin
def validate
 # apos=:SVC_FromHour
  errors.add(:SVC_ToHour,:SVC_FromHour,"^Please select To time greater than From Time") if SVC_ToHour <SVC_FromHour

end
=end


class Service < ActiveRecord::Base
     validates_presence_of :SVC_ServiceName, :on =>:create,:message =>"^Service name shouldn't be blank"
     validates_presence_of :SVC_ServiceName, :on => :update,:message =>"^Service name shouldn't be blank"
   
     validates_length_of  :SVC_ServiceName, :maximum => 50,  :on =>:create,:message =>"^Service Name length should be less then 30"
     validates_length_of  :SVC_ServiceName, :maximum => 50,  :on =>:update,:message =>"^Service Name length should be less then 30"

     validates_format_of :SVC_ServiceName,
     :with => /^[A-Z a-z 0-9 .-]*\z/ ,
     :message => "^ServiceName cannot contain Special Symbols and numeric values",
     :on => :create
     validates_format_of :SVC_ServiceName,
     :with => /^[A-Z a-z 0-9 .-]*\z/ ,
     :message => "^ServiceName cannot contain Special Symbols and numeric values ",
     :on => :update
    
     validates_uniqueness_of :SVC_ServiceName, :on => :create,:message=> "^Service name already exist,the value which you entered"
     validates_uniqueness_of :SVC_ServiceName, :on => :update,:message=> "^Service name already exist,the value which you entered"
     
     
     
     validates_presence_of :SVC_ServiceAcronym,  :on =>:create,:message =>"^ServiceAcronym shouldn't be blank"
     validates_presence_of :SVC_ServiceAcronym,  :on =>:update,:message =>"^ServiceAcronym shouldn't be blank"
     
     validates_length_of  :SVC_ServiceAcronym, :maximum => 2,  :on =>:create,:message =>"^Service Acronym length should be less then 2"
     validates_length_of  :SVC_ServiceAcronym, :maximum => 2,  :on =>:update,:message =>"^Service Acronym length should be less then 2"
     
     validates_format_of :SVC_ServiceAcronym,
     :with =>/^[A-Z a-z -]*\z/ ,
     :message => "^Service Acronym cannot contain Special Symbols and numeric values",
     :on => :create
     validates_format_of :SVC_ServiceAcronym,
     :with => /^[A-Z a-z -]*\z/ ,
     :message => "^Service Acronym cannot contain Special Symbols and numeric values",
     :on => :update
     
     validates_uniqueness_of :SVC_ServiceAcronym, :on => :create,:message=> "^Service Acronym already exist the value which you entered"
     validates_uniqueness_of :SVC_ServiceAcronym, :on => :update,:message=> "^Service Acronym already exist the value which you entered"
     
     validates_presence_of :SVC_ButtonNo,  :on =>:create,:message =>"^ButtonNo shouldn't be blank"
     validates_presence_of :SVC_ButtonNo,  :on =>:update,:message =>"^ButtonNo shouldn't be blank"
    
     validates_numericality_of :SVC_ButtonNo ,:on => :create,:message =>"^ButtonNo should be numeric value"
     validates_numericality_of :SVC_ButtonNo ,:on => :update,:message =>"^ButtonNo should be numeric value"
  
     validates_uniqueness_of :SVC_ButtonNo, :on => :create,:message=> "^Button number already exist the value which you entered"
     validates_uniqueness_of :SVC_ButtonNo, :on => :update,:message=> "^Button number already exist the value which you entered"
   
   
     validates_presence_of :SVC_Priority,  :on =>:create,:message =>"^Priority shouldn't be blank"
     validates_presence_of :SVC_Priority,  :on =>:update,:message =>"^Priority shouldn't be blank"
     
     validates_numericality_of :SVC_Priority ,:on => :create,:message =>"^Priority should be numeric value"
     validates_numericality_of :SVC_Priority ,:on => :update,:message =>"^Priority should be numeric value"
  
     validates_uniqueness_of :SVC_Priority, :on => :create,:message=> "^Priority already exist the value which you entered"
     validates_uniqueness_of :SVC_Priority, :on => :update,:message=> "^Priority already exist the value which you entered"
   
   
     validates_presence_of :SVC_ThresholdTimeMins,  :on =>:create,:message =>"^ThresholdTimeMins shouldn't be blank"
     validates_presence_of :SVC_ThresholdTimeMins,  :on =>:update,:message =>"^ThresholdTimeMins shouldn't be blank"
     
     validates_presence_of :SVC_GroupID, :on => :create, :message =>"^ Please select Group Name"
=begin
def validate
 # apos=:SVC_FromHour
  errors.add(:SVC_ToHour,:SVC_FromHour,"^Please select To time greater than From Time") if SVC_ToHour <SVC_FromHour
end
=end
end


