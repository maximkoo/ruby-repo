aa={a:100, b:200}

x=aa.detect do |k,v|
	v>100	
end

puts x