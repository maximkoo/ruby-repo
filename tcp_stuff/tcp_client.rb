require 'socket'
server = TCPSocket.new 'localhost', 5678

if line = server.gets
  puts line
end

server.close