class Carddetail < ActiveRecord::Base
   # validates_presence_of :priority,:on =>:create
     # validates_presence_of :priority,:on =>:update
        validates_presence_of :bin,:on =>:create
        
         validates_uniqueness_of :product,:on =>:create, :message=> "^Already contain a record for product"
          validates_uniqueness_of :product,:on =>:update, :message=> "^Already contain a record for product"
          
           validates_uniqueness_of :bin,:on =>:create, :message=> "^Already contain a record for bin number"
            validates_uniqueness_of :bin,:on =>:update, :message=> "^Already contain a record for bin number"
            
  validates_presence_of :bin,:on =>:update
   validates_presence_of :product,:on =>:create
  validates_presence_of :product,:on =>:update
  
   validates_presence_of :priority,:on =>:create
  validates_presence_of :priority,:on =>:update
    #  validates_numericality_of :priority, :on => :create, :mesage => "Enter numeric value for Priority"
    validates_numericality_of :bin, :on => :create, :message => "^Enter numeric value for Bin"
    
 validates_length_of :bin, :maximum=> 6, :on => :create, :message=> "^Bin Number should not be greater than 40 characters"
 validates_length_of :bin, :maximum=> 6,:on => :update, :message=> "^Bin Number should not be greater than 40 characters"

validates_length_of :product, :maximum=> 40, :on => :create, :message=> "^Product value should not be greater than 40 characters"
validates_length_of :product, :maximum=> 40, :on => :update, :message=> "^Product value should not be greater than 40 characters"

def validate
  errors.add(:expiredate,"^Please select proper expiry date") if expiredate < Time.now()
  #errors.add(:expiredate,"^Please select proper expiry date") if expiredate < Date.today
end
end
