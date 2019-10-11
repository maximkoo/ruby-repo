require 'webrick'
server = WEBrick::HTTPServer.new(:DocumentRoot => '.', :Port=>6789);
trap('INT') { server.shutdown}
trap('TERM') { server.shutdown}
server.start