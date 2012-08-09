class AccountController < ApplicationController
  model   :user
  require 'rubygems'
 require 'net/ldap'
  def login1111
    case @request.method
      when :post
        if @session['user'] = User.authenticate(@params['user_login'], @params['user_password'])
         @result=User.login_type(@params['user_login'],@params['user_password'])

         
	  if @result.USR_IsActive==1	
            if @result.USR_IsActive==1 and @result.USR_IsLogin=='N'
            @user=User.find(@result.id)
              
             @user.USR_IsLogin='Y'
             @user.save
             
         
          if @result.USR_Role=="Admin"
          session[:login]=@params['user_login']  
           session[:role]=@result.USR_Role
          redirect_to  :controller => 'administration',:action => "main"
          
          else
          session[:login]=@params['user_login']
         
           session[:role]=@result.USR_Role
          redirect_to :controller =>'users',:action => "main"
          
        end
         #********End if (usertype)*****************
        else
            @message = "User is already logged in"
        end
	else
		@message="You cannot login !!"
	end 	 
        
        else
          @login    = @params['user_login']
          @message  = "Login unsuccessful........"
      end
    end
  end
  


def logincmt
    login=@params['user_login']
    password=@params['user_password']
    if login.blank? or password.blank?
                       @message="Username or password should not be blank..."
                        render :action =>'login' 
    else
                     commd="ping 10.16.1.117 -n 1"
                                y=system(commd)
                              if y==true
                                     ldap_con = Net::LDAP.new({:host =>"10.16.1.117",
                                                                 :port => 3268,:auth=>{:method=>:simple,:username =>"#{login}@icicibankltd.com",
                                                                 :password => "#{password}" } } )
                                                                 b=ldap_con.bind 
                                     if b==true
                                              @com=User.find(:first,:select=>"USR_Role,USR_IsLogin,USR_UserName,login,id",:conditions => ["login=? ","#{login}"])  
                                              if @com.USR_IsLogin=='Y'
                                                          @message="User Is Already logged in..."
                                                          render :action => 'login'
                                              else        
                                                          User.update(@com.id,{:USR_IsLogin =>'Y'})
                                                          @session['login']=@com.login
                                                          session[:role]=@com.USR_Role
                                                          if @com.USR_Role=='cmt_Admin'
                                                                      redirect_to  :controller => 'administration',:action => "main"
                                                          end      
                                                          if @com.USR_Role=='cmt_BranchOperator'
                                                                      redirect_to :controller => 'users',:action => "main"
                                                          end
                                                          if @com.USR_Role=='Admin'
                                                                      @message="Username Or Password Invalid..."
                                                                      render :action => 'login'
                                                         end
                                                         if @com.USR_Role=='Operator'
                                                                     @message="Username Or Password Invalid..."
                                                                     render :action => 'login'
                                                         end
                                              end 
                                      else
                                              @usr_chk=User.find(:first,:conditions =>["login=?","#{login}"])
                                              if @usr_chk==nil
                                                             @message="UserName or Password Is Incorrect..."
                                                             render :action =>'login'
                                             else
                                                             @count=User.find(:first,:select =>"user_count,id",:conditions =>["login=?","#{login}"])
                                                             @id1=@count.id
                                                             @count1=@count.user_count
                                                             @count1= @count1+1
                                                             if @count1<=3
                                                                           @update=User.update(@id1,{:user_count =>"#{@count1}"})
                                                                           @message="UserName or Password Is Incorrect..."
                                                                           render :action =>'login'
                                                             else
                                                                          @update1=User.update(@id1,{:USR_IsActive =>'0'})
                                                                          @message="User Is Blocked..."
                                                                          render :action =>'login'
                                                             end
                                            end                        
                                        end
                                else
                                          @message="Sorry! LDAP Server not available please try after some time..."
                                          render :action =>'login' 
                                        end
    end
end  
  
    
  def login


end
  
  def signup
    case @request.method
      when :post
        @user = User.new(@params['user'])
        
        if @user.save      
          @session['user'] = User.authenticate(@user.login, @params['user']['password'])
          flash['notice']  = "Signup successful"
          redirect_to :action => "welcome" 
        end
      when :get
        @user = User.new
    end      
  end  
  
  def delete
    if @params['id'] and @session['user']
      @user = User.find(@params['id'])
      @user.destroy
    end
   redirect_to :action => "welcome"
  end  
    
  def logout
    begin
    #puts "in logout"
    
     cookies.delete :user_id 
   @user= User.find_first(["login = ? and USR_IsLogin='Y'",@session['login']])
  
                 
@user.USR_IsLogin='N'
@user.save

    
    
       
    @session['login'] = nil
    reset_session
      rescue Exception => exc
    #STDERR.puts "Error is #{exc.message}"
end 
end

     def logout1
    begin
    #puts "in logout"
     cookies.delete :user_id 
   @user= User.find_first(["login = ? and USR_IsLogin='Y'",@session['user']['login']])
  
                 
@user.USR_IsLogin='N'
@user.save
    @session['user'] = nil
     render :update do |page|
  page.redirect_to url_for(:controller=>'account', :action=>'logout')
  end
    rescue Exception => exc
    #STDERR.puts "Error is #{exc.message}"
  end        
  end
  
  def password 

   @user = @session['user']

   case @request.method
      when :post
 
      if@params['new_password']==""     
           
          @msg= 'Please enter your new Password !'
      end
      if@params['old_password']==""     
            
          @msg= 'Please enter your old Password !'
      end
        if @params['new_password_confirmation']==""     
          
          @msg= 'Please enter your Password again for confirmation!'
        end
        unless @user.password_check?(@params['old_password'])   

          @msg= 'You have introduced a wrong old password!'
          else
          unless @params['new_password'] == @params['new_password_confirmation']
            @msg = 'Your new password and password confirmation dont match!'
            else
        
            @msg = 'Your password was changed successfully!' if @user.change_password(@params['new_password'])
           
           end
          end 
     
        end

  end



  def welcome
  end
  
end
