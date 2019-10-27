# tcp_server.rb
require 'socket'
server = TCPServer.new 5678

while session = server.accept
  session.puts "Hello world! The time is #{Time.now}"
  session.puts "Hello world-2! The time is #{Time.now}"
  puts session.object_id;
  puts session.class.name
  session.close
end