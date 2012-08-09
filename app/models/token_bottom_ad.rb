class TokenBottomAd < ActiveRecord::Base
     validates_presence_of :BOT_AdMessage,  :on =>:create,:message =>"^Token Footer shouldn't be blank"
     validates_presence_of :BOT_AdMessage,  :on =>:update,:message =>"^Token Footer shouldn't be blank"
     
     validates_uniqueness_of :BOT_AdMessage, :on =>:create,  :message => "^Already contain a record for the entered value"
     validates_uniqueness_of :BOT_AdMessage, :on =>:update,  :message => "^Already contain a record for the entered value"
     
     #validates_length_of :BOT_AdMessage, :minimum => 40, :on => :create, :message=> "^ Bottom AdMessage should be minimum 40 digits"
     #validates_length_of :BOT_AdMessage,  :minimum => 40, :on => :update, :message=> "^Bottom AdMessage should be minimum 40 digits"

     validates_length_of :BOT_AdMessage, :maximum=> 100, :on => :create, :message=> "^Token Footer should be maximum 100 digits"
     validates_length_of :BOT_AdMessage,  :maximum => 100, :on => :update, :message=> "^Token Footer should be maximum 100 digits"
   
end
