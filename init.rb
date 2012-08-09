at_exit do
  require 'irb'
  require 'drb/acl'
  require 'dbi'
  #require 'mysql'
  require 'csv'
  require 'fastercsv'
  require 'sha1'
  #require 'customer_error_message'
end
load 'script/server'
#load "script/scgi_service"

