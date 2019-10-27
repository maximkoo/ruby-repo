require 'socket'
server = TCPSocket.new 'localhost', 5678

sleep 2	
if line = server.gets
  puts line
end
if line = server.gets
  puts line
end

#server.close