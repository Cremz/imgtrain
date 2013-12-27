module ApplicationHelper


	def long2ip(long)
	  ip = []
	  4.times do |i|
	    ip.push(long.to_i & 255)
	    long = long.to_i >> 8
	  end
	  ip.join(".")
	end
end
