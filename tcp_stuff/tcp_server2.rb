# tcp_server.rb
require 'socket'
class Server1
	def initialize
		@server = TCPServer.open('localhost',5678)
		wait_for_connections
	end;

	def wait_for_connections

loop {
  session = @server.accept
puts "New session registered, id=#{session.object_id.to_s}";
  #a=session.gets.chomp
#puts "Server is at 2";
#  puts session.object_id.to_s+" has sent #{a}";
#puts "Server is at 3";
#  session.puts "Hello world! The time is #{Time.now}"
#  session.puts "I received your #{a}"
#puts "Server loops over";  
  #session.close
  wait_for_messages(session)
}
end;

def wait_for_messages(session)
	loop do
		a=session.gets.chomp
		puts "session #{session.object_id.to_s} says #{a}"
		
		session.puts "Hello session! The time is #{Time.now}" 
		session.puts "I received your #{a}" 
	end
end;	
end;

c=Server1.new