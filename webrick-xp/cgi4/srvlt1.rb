class Srvlt1<WEBrick::HTTPServlet::AbstractServlet
	def do_GET(request, response)
		@prm1=0
		response.status=200;
		response.content_type="text/plain"
		if !request.query['param1'].nil?
			response.body="param1=#{request.query['param1']}!!!"
			@prm1=request.query['param1']
		else 
			response.body="param1=#{@prm1}"
		end;	
	end;
end;