require 'thread'
x=0
t=Thread.new do
	Thread.stop;
	puts "a"
end;
puts 1
t.join
# while !t.stop? do 
# 	x+=1
# 	puts "Waiting for the thread to stop " + x.to_s #120..473 раза
# 	#sleep 0.001
# end;	
t.run
#sleep 1
puts 2
sleep 3
