require 'cgi'
cgi=CGI.new("html4")
cgi.out do
	cgi.html do
		cgi.head do
			cgi.title do 
				"A COOL TITLE"
			end +
			"A header that sux"	
		end+
		cgi.p+
		cgi.body do 
			"Body starts here"+cgi.br+
			"Parameter1="+cgi["param1"]+
			cgi.form("METHOD"=>"get","ACTION"=>"page2.cgi") do
				"Input a value: "+cgi.input("id"=>"input1","name"=>"input1") +				
			
				cgi.br+

				cgi.button("value"=>"Button1", "id"=>"button1") do
					"This is button 1"
				end +	

				cgi.br+
				
				cgi.button("value"=>"Button2", "id"=>"button2","type"=>"submit") do
					"This is submit button"
				end;	
			end +
			cgi.br+
			cgi.table("border"=>"1px") do
				cgi.tr do
					cgi.td do
						"cell 1"
					end+	
					cgi.td do
						"cell 2"
					end	
				end	
			end+
			"Body ends here"
		end;	
	end;	
end;