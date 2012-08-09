class DisplayScrollMessage < ActiveRecord::Base
     validates_presence_of :SCRL_DisplayScrollMessage,  :on =>:create,:message =>"^Enter the new message"
 validates_uniqueness_of :SCRL_DisplayScrollMessage, :on =>:create,  :message => "^Already contain a record for the entered value"
     validates_presence_of :SCRL_DisplayScrollMessage,  :on =>:update,:message =>"^Enter the new message"
 validates_uniqueness_of :SCRL_DisplayScrollMessage, :on =>:update,  :message => "^Already contain a record for the entered value"
# validates_length_of :SCRL_DisplayScrollMessage, :minimum => 40, :on => :create, :message=> "^ DisplayScrollMessage  should be minimum 40 digits"
   # validates_length_of :SCRL_DisplayScrollMessage,  :minimum => 40, :on => :update, :message=> "^DisplayScrollMessage should be minimum 40 digits"

    validates_length_of :SCRL_DisplayScrollMessage, :maximum=> 50, :on => :create, :message=> "^DisplayScrollMessage should be less than 50 characters"
    validates_length_of :SCRL_DisplayScrollMessage,  :maximum => 50, :on => :update, :message=> "^DisplayScrollMessage should be less than 50 characters"
=begin
    validates_format_of :SCRL_DisplayScrollMessage,
    :with => /^[0-9.]*\z/,
    :message => "^DisplayScrollMessage Cannot contain Special Symbols,White Space and alphabates",
    :on => :create
  
  validates_format_of :SCRL_DisplayScrollMessage,
  :with => /^[0-9.]*\z/,
  :message => "^DisplayScrollMessage Cannot contain Special Symbols,White Space and alphabates",
  :on => :update
=end

end
