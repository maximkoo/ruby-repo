require 'btce'
ticker = Btce::Ticker.new "nmc_usd"
puts "Last price=#{ticker.last}"
tapi = Btce::TradeAPI.new_from_keyfile
j={"pair"=>"nmc_usd","type"=>"buy","amount"=>"0.1","rate"=>(ticker.last/2).to_s};
t=tapi.trade(j)
puts t
if t["success"]==1	
	puts "Order placed, order_id: #{t["return"]["order_id"]}"
	@order_id=t["return"]["order_id"]
else
	puts "No success, error: \"#{t["error"]}\""
end;	

# #t=tapi.cancel_order("order_id"=>"47635156");
# #puts t
puts 
puts "ORDERS"
@orders=tapi.order_list
puts @orders
if !@order_id.nil?
	if @orders["return"].key?(@order_id.to_s)
		puts "Order #{@order_id} still incomplete"
	else
		th=tapi.trade_history
		if th["return"].each do |k,v|
				if v.key?(@order_id)
					puts "Order #{@order_id} complete!"
				end;	
			end;
		end;	
	end;	
end; 


