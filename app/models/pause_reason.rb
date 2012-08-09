=begin
class PauseReason < ActiveRecord::Base
  
  validates_presence_of:PR_PauseReasonDesc, :on => :create, :message =>"^Pause Reason Description shouldn't be blank"
    validates_presence_of:PR_PauseReasonDesc, :on => :update, :message =>"^Pause Reason Description shouldn't be blank"

  validates_uniqueness_of:PR_PauseReasonDesc, :on => :create, :message =>"^Already exist the value which you entered"
  validates_uniqueness_of:PR_PauseReasonDesc, :on => :update, :message =>"^Already exist the value which you entered"

validates_format_of :PR_PauseReasonDesc,
                            :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
                            :message =>"^ PauseReason Can not contain special symbol",
                            :on =>:create
validates_format_of :PR_PauseReasonDesc,
                            :with =>/^[A-Z a-z 0-9 -.]*\z/ ,
                            :message =>"^ Can not contain special symbol",
                            :on => :update
end
=end


class PauseReason < ActiveRecord::Base
  
     validates_presence_of:PR_PauseReasonDesc, :on => :create, :message =>"^Pause Reason Description shouldn't be blank"
     validates_presence_of:PR_PauseReasonDesc, :on => :update, :message =>"^Pause Reason Description shouldn't be blank"

     validates_length_of:PR_PauseReasonDesc, :maximum  => 15,:on => :create, :message =>"^Pause Reason  length should be less then 15"
     validates_length_of:PR_PauseReasonDesc, :maximum  => 15,:on => :update, :message =>"^Pause Reason  length should be less then 15"

     validates_uniqueness_of:PR_PauseReasonDesc, :on => :create, :message =>"^Already exist the value which you entered"
     validates_uniqueness_of:PR_PauseReasonDesc, :on => :update, :message =>"^Already exist the value which you entered"

     validates_format_of :PR_PauseReasonDesc,
                            :with =>/^[A-Za-z 0-9.]*\z/ ,
                            :message =>"^ PauseReason Can not contain special symbol",
                            :on =>:create
     validates_format_of :PR_PauseReasonDesc,
                            :with =>/^[A-Za-z 0-9.]*\z/ ,
                            :message =>"^ Can not contain special symbol",
                            :on => :update

=begin
     validates_format_of :PR_PauseReasonDesc, :on => :create, 
                              :with =>/^\D\w+$/i,
                              :message => "^ PauseReasonDesc can only contain Alphanumeric value."
     validates_format_of :PR_PauseReasonDesc, :on => :update, 
                              :with => /^\D\w+$/i,
                              :message => "^ PauseReasonDesc can only contain Alphanumeric value."
=end
end


