class TokenController < ApplicationController

layout 'sidenew'
 
  def index
    
    list
    render :action => 'list'
  end

def cancel
render :update do |page|
page.redirect_to url_for(:controller=>'token', :action=>'list')
end
end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    
    @token_pages, @token = paginate :token, :per_page => 10
  end
def edit
  @token=TokenBottomAd.find(params[:id])
  puts "***************gfdfgdfgdf******************"
    puts @token.inspect
    puts "****************dfgdgdgdgfd*****************"
  end
  

 
  def show
    @token = TokenBottomAd.find(params[:id])
  end

  def new
    
    @token = TokenBottomAd.new
  end
 def signup
    case @request.method
      when :post
        @token= TokenBottomAd.new(@params['tokenbottomad'])
        
        if @token.save      
          @session['user'] = Token.authenticate(@token.user_USR_LoginID, @params['user']['password'])
          redirect_to :action => "list"  
                   
        end
      when :get
        @token=TokenBottomAd.new
    end      
  end   



  def create
   
        @token = TokenBottomAd.new(params[:tokenbottomad])
           if  @token.save
               redirect_to :action => 'list'
               flash[:notice] = fading_flash_message("Token footer get added successfully.", 3)       
          else
              render :action => 'signup'
     end
  end
  def update
        @token=TokenBottomAd.find(params[:id])
        puts "(((((((((((*********)))))))))))))))"
        puts @token.inspect
        puts "(((((((((((*********)))))))))))))))"
        if @token.update_attributes(params[:token_bottom_ads])
          redirect_to :action=>"list" 
          flash[:notice] = fading_flash_message("Token footer get updated successfully.", 3) 
     else
          render :action => "edit"
  end    
   end 

  def delete
  TokenBottomAd.find(params[:id]).destroy
    redirect_to :action => 'list'
    flash[:notice] = fading_flash_message("Token footer get deleted successfully.", 3) 
  end
end
