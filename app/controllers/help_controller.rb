class HelpController < ApplicationController
      puts "########################################"
  def help1

    #send_data(File.read("#{RAILS_ROOT}/" + "1.pdf"), :file_name   => file_name, :disposition => "inline") 
    send_file("public/help/1.pdf", :type => 'application/pdf', :disposition => 'attachment')

  end
  
end
