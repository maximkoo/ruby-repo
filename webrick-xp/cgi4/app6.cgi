require 'cgi'
require 'cgi/session'
cgi=CGI.new("html4");
sess = CGI::Session.new( cgi, "session_key" => "cgi_session1", "session_id"=>"242","prefix"=>"kokokoko");

if cgi["param1"][0]=~/[0-9]/
	sess["param1"] =cgi["param1"]
end;

sess["StupidParam1"]="12345"
sess["StupidParam2"]="123456"
sess["SmartParam"]="3.1415"

cgi.out do 
	cgi.html do
		cgi.h1 do
			#"param1=#{prm1}"
			"param1=#{sess["param1"]}"+cgi.br+
			"session_id=#{sess.session_id}"+cgi.br+
			"_session_id=#{sess["_session_id"]}"+cgi.br
		end	
	end
end 
	
