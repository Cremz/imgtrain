class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  	def ip2long(ip)
	  long = 0
	  ip.split(/\./).each_with_index do |b, i|
	    long += b.to_i << ( 8*i )
	  end
	  long
	end

end
