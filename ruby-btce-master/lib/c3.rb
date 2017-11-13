require 'btce'
ticker = Btce::Ticker.new "nvc_usd"
puts "Last price=#{ticker.last}"
tapi = Btce::TradeAPI.new_from_keyfile
j={"pair"=>"nvc_usd","type"=>"buy","amount"=>"0.1","rate"=>(ticker.last/2).to_s};
#t=tapi.trade(j)
t=tapi.cancel_order("order_id"=>"47635156");
puts t
puts 
puts "ORDERS"
orders=tapi.order_list
puts orders