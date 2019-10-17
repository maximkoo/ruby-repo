require 'cgi'
a=""
cgi=CGI.new("html4");
cgi.out do 
	cgi.html do
		cgi.h1 do
				(1..5).each do |i|
					a+=i.to_s+cgi.br
				end;
				a
		end;	
	end;
end;