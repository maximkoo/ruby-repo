# tcp_server.rb
require 'socket'
server = TCPServer.new 5678

if session = server.accept
  session.puts "Hello world! The time is #{Time.now}"
  puts session.object_id;
  session.close
end