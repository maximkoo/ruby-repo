require 'thread'
a=0
t=Thread.new do
 10.times do
 	a+=1;
 	puts "Local 1: "+a.to_s 	
 	sleep 0.1
 end

end;

t2=Thread.new do
 Thread.stop
 #t1.join
 20.times do
 	puts "Local 2:  "+a.to_s 	
 	sleep 0.1
 end
end;
#t.join
#t2.join
sleep 5
#t2.run
#t2.join
