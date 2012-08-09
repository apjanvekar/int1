class DisplayscrollmessageController < ApplicationController

 layout 'sidenew'
  def index
    
    list
    render :action => 'list'
  end

def cancel
render :update do |page|

page.redirect_to url_for(:controller=>'displayscrollmessage', :action=>'list')

end
end
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
   
    @scrollmsg_pages, @scrollmsg= paginate :display_scroll_message, :per_page => 10
  end

  def show
    @scrollmsg = DisplayScrollMessage.find(params[:id])
  end

  def new
   
    @scrollmsg= DisplayScrollMessage.new
  end
  
def signup
    case @request.method
      when :post
      
        @scrollmsg= DisplayScrollMessage.new(@params['displayscrollmessage'])
        
        if @scrollmsg.save      
          flash['notice']  = "Signup successful"
          redirect_to :action => "list"          
        end
      when :get
       
        @scrollmsg=DisplayScrollMessage.new
        
    end      
  end  
  def create
    @scrollmsg= DisplayScrollMessage.new(params[:displayscrollmessage])
    if @scrollmsg.save
      redirect_to :action => 'list'
      flash[:notice] = fading_flash_message("Display scroll message get added successfully.", 3)     
    else
      render :action => 'signup'
    end
  end

  def edit
    @scrollmsg= DisplayScrollMessage.find(params[:id])

  end

  def update
    @scrollmsg = DisplayScrollMessage.find(params[:id])
    if @scrollmsg.update_attributes(params[:display_scroll_messages])
      redirect_to :action => 'list'
      flash[:notice] = fading_flash_message("Display scroll message get updated successfully.", 3)     
    else
      render :action => 'edit'
    end
  end

  def delete
  DisplayScrollMessage.find(params[:id]).destroy
    redirect_to :action => 'list'
    flash[:notice] = fading_flash_message("Display scroll message get deleted successfully.", 3)     
  end
end


