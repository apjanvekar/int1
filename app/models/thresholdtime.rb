class Thresholdtime < ActiveRecord::Base
    validates_uniqueness_of :ctypeid,:on =>:update,:message =>"^Already contain a record for customer id"
    validates_uniqueness_of :ctypeid,:on =>:create,:message =>"^Already contain a record for customer id"
    
  validates_presence_of :ctypedesc,:on =>:update,:message =>"^Already contain a record for customer type"
  validates_presence_of :ctypedesc,:on =>:create,:message =>"^Already contain a record for customer type "
    
    
     validates_uniqueness_of :priority,:on =>:create,:message =>"^Already contain a record for Priority "
     validates_uniqueness_of :priority,:on =>:update,:message =>"^Already contain a record for Priority "
       # validates_presence_of :priority,:on =>:create
    validates_presence_of :ctypeid,:on =>:create, :message =>"^Please Enter the Customer ID"
    validates_numericality_of :ctypeid, :on => :create, :message => "^Enter numeric value for customer ID"
    
        

    validates_numericality_of :priority, :on => :create, :message => "^Enter numeric value for Priority"
    validates_numericality_of :priority, :on => :update, :message => "^Enter numeric value for Priority"


validates_format_of :ctypedesc,
  :with => /^[A-Z a-z 0-9]*\z/,
  :message => "^Customer Type Should Not Contain Special Character",
  :on => :create
validates_format_of :ctypedesc,
  :with => /^[A-Z a-z 0-9]*\z/,
  :message => "^Customer Type Should Not Contain Special Character",
  :on => :update
   
end
