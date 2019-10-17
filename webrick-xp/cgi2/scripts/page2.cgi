require 'cgi'
cgi=CGI.new("html4")
cgi.out do
	cgi.html do
		cgi.head do
			cgi.title do 
				"TITLE 2"
			end +
			cgi.h1 do 
				"Header 2"
			end		
		end+

		cgi.p+
		
		cgi.body do 
			"Input value passed="+cgi["input1"]
		end;
	end;
end;			