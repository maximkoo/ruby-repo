require 'thread'
m=Mutex.new
a=0;
p1=proc do 
	while a<10
		m.synchronize do
		a+=1
		#puts a
		sleep 0.22
		end;
	end	
	
end	

p2=proc do
	while a<10
		m.synchronize do
			puts a;
			sleep 0.1
		end;
	end;
end

t=Thread.new do	
	p1.call
end;
tt=Thread.new do
		p2.call
end;

#m.synchronize do
	#t.wakeup
	#t.run

	#tt.run
	#tt.join
#end;	
tt.join

