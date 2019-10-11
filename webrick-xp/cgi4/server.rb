require 'webrick'
require_relative 'srvlt1.rb'
server=WEBrick::HTTPServer.new(:Port=>6789,:DocumentRoot=>File.join(Dir.pwd,''));
server.mount('/srvlt1',Srvlt1)
server.start;