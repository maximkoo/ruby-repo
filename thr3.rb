require 'thread'
a=0
t=Thread.new do
 10.times do
 	a+=1;
 	puts "Local: "+a.to_s 	
 	sleep 0.1
 end
end;
#t.join
puts "Main Thread time is: "+Time.new.to_s
20.times do
	sleep 0.1
	puts "Main Thread a="+a.to_s;
end;
