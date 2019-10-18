require 'socket'
server = TCPSocket.new 'localhost', 5678
#server.puts("TROLOLO")
#while line = server.gets
#  puts line
# end
a=''
loop{
	puts "we are at 1"
	 b=$stdin.gets
		server.puts(b.chomp)
	#puts "we are at 2"	
	#a=server.gets;
	#puts a
	#puts "we are at 3" 
	#a=server.gets
	#puts a
	#2.times do
	# 	a=server.gets
	# 	puts a
	#end;
	puts "loop over"
}

#server.close