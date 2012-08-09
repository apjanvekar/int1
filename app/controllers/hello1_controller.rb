class Hello1Controller < ApplicationController
require 'net/ldap'
require 'rexml/document'
include REXML
wsdl_service_name 'Hello1'
web_service_api Hello1Api
web_service_scaffold :invoke


def login(login,password,soleid)
  
          file = File.new("D:/CMT_XML.xml")
          doc = Document.new(file)
          @ldap_ip= doc.root.elements[1].elements["LDAP_IP"].text
          @ldap_port_number=doc.root.elements[1].elements["LDAP_PORT"].text
          
    @a=login
    @received_soleid=soleid
    @check_user=User.count(:first,:select=>"login",:conditions =>["login=?","#{login}"])
    if  @check_user==1
                 ldap_con = Net::LDAP.new({:host =>"#{@ldap_ip}",
                                           :port => "#{@ldap_port_number}",:auth=>{:method=>:simple,:username =>"#{login}@icicibankltd.com",
                                           :password => "#{password}" } } )
                         
                 b=ldap_con.bind 
                 if b==false
                  #################### If LDAP returns false then this code gets execute ####################################                 
                      @user_check=User.find(:first,:select=>"login",:conditions =>["login=?","#{login}"])
                                 if @user_check==nil
                                    return "meassage1"   
                                 else
                                      @count=User.find(:first,:select =>"user_count,id",:conditions =>["login=?","#{login}"])
                                      @id1=@count.id
                                      @count1=@count.user_count
                                      @count1= @count1+1
                                      if @count1<=100
                                         @update=User.update(@id1,{:user_count =>"#{@count1}"})
                                         return "message1"
                                      else
                                         @update1=User.update(@id1,{:USR_IsActive =>'0'})
                                         return "message2"                          
                                      end 
                                 end    
                  else
                   ######################  IF LDAP returns true then this code gets execute     ####################
                   @check_user_solid=User.count(:first,:select=>"login",:conditions =>["login=? and solid=?","#{login}","#{soleid}"])  
                 if @check_user_solid==1                   
                         @com=User.find(:first,:select=>"USR_Role,USR_IsLogin,USR_UserName,login,id",:conditions => ["login=? ","#{login}"])
                          if  @com.USR_Role=='Operator'
                                      return "Operator"
                          elsif  @com.USR_Role=='Admin'
                                      return "Admin"
                          elsif  @com.USR_Role=='Superadmin' 
                                      return "Superadmin"
                         end    
                 
                else
                       return "message3"  
                     end 
          end           
    else
       return "message1"  
    end
end 
 
    def logout(login)
      
       @usd=User.find(:first,:select=>"USR_IsLogin,login,id,USR_Role",:conditions => ["USR_IsLogin=? and login=? ",'Y',"#{login}"])
       @a=@usd.id
       @b=@usd.USR_Role
       @asd=User.update(@a,{:USR_IsLogin=> 'N'})
                   if @usd.USR_Role=='Admin'
                   return "Admin"
         elsif @usd.USR_Role=='Operator' 
                   return "Operator"
        end
  end

end 
 
 
