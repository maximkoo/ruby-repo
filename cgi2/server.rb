require 'webrick'
server=WEBrick::HTTPServer.new(:Port=>6789,:DocumentRoot=>File.join(Dir.pwd,'/scripts'));
server.start;