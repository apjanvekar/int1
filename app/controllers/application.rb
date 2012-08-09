#Version CMT_ROR_ver1.0.0
#Version CMT_ROR_ver1.0.1
require 'custom_error_message'
require 'login_system'

class ApplicationController < ActionController::Base
  include LoginSystem
  model :user
  #before_filter :login_required
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_CMT_session_id'
  
  #################################################################################
##                           Session Expiration                                ##
##                                   Start                                     ##
#################################################################################
MAX_SESSION_TIME = 900
before_filter :prepare_session

def prepare_session

   if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
      # Session has expired. Clear the current session.
      #cookies.delete :user_id
	redirect_to :controller =>'account',:action =>'logout'
      #reset_session
   end

   # Assign a new expiry time, whether the session has expired or not.
   session[:expiry_time] = MAX_SESSION_TIME.seconds.from_now
   return true
end
#################################################################################
##                           Session Expiration                                ##
##                                   End                                       ##
#################################################################################
def fading_flash_message(text, seconds=3)
  text +
    <<-EOJS
      <script type='text/javascript'>
        Event.observe(window, 'load',function() { 
          setTimeout(function() {
            message_id = $('notice') ? 'notice' : 'warning';
            new Effect.Fade(message_id);
          }, #{seconds*1000});
        }, false);
      </script>
    EOJS
end

end
