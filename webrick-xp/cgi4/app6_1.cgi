require 'cgi'
require 'cgi/session'
cgi=CGI.new("html4");
sess = CGI::Session.new( cgi, "session_key" => "cgi_session1","prefix"=>"kokokoko");

cgi.out do 
	cgi.html do
		cgi.h1 do
			#"param1=#{prm1}"
			"StupidParam1=#{sess["StupidParam1"]}"+cgi.br+
			"StupidParam2=#{sess["StupidParam2"]}"+cgi.br+
			"SmartParam=#{sess["SmartParam"]}"+cgi.br
		end	
	end
end 