require 'thread'
t=Thread.new do
	puts 1;
	sleep 2.8
	Thread.stop;
	puts 2;
end;
sleep 3
t.run