require 'cgi'
cgi=CGI.new("html4");
if cgi["param1"]!=""
	prm1=cgi["param1"] 
else
	prm1=999
end;

cgi.out do 
	cgi.html do
		cgi.h1 do
			"param1=#{prm1}"
		end	
	end
end 
	
