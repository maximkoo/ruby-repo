require 'cgi'
require 'cgi/session'
cgi=CGI.new("html4");
sess = CGI::Session.new( cgi, "session_key" => "a_test")

if cgi["param1"][0]=~/[0-9]/
	prm1=cgi["param1"]
	sess["param1"] =cgi["param1"]
else
	prm1=999
end;

cgi.out do 
	cgi.html do
		cgi.h1 do
			#"param1=#{prm1}"
			"param1=#{sess["param1"]}"+cgi.br+
			"session_id=#{sess.session_id}"+cgi.br+
			"session_id=#{cgi["a_test"]}"
		end	
	end
end 
	
