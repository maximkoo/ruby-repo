require 'btce'
ticker = Btce::Ticker.new "nvc_usd"
# JSON_METHODS = %w(high low avg vol vol_cur last buy sell updated)
puts ticker.json
#puts "high=#{ticker.high}"
#puts "high=#{ticker.low}"
#puts "high=#{ticker.avg}"
puts "last=#{ticker.last}"
puts "buy=#{ticker.buy}"
puts "sell=#{ticker.sell}"
puts "updated=#{Time.at(ticker.updated)}"

puts 
#puts
#sleep(1)

info = Btce::TradeAPI.new_from_keyfile.get_info
puts info
puts
puts info["return"]["rights"]

sleep(1)
puts "ORDERS"
tapi = Btce::TradeAPI.new_from_keyfile
orders=tapi.order_list
puts orders
puts
puts orders["success"]
#order_ids=[]
#order_ids=["42296268", "41524896"]
orders['return'].each do |k,v|
 	puts k
 	#puts "Order #{k} still incomplete!"  if order_ids.include? k
 	puts v["pair"]
 	puts v["amount"]
 	puts "ORDER INFO"
 		orderInfo=tapi.order_info({"order_id"=>k});
 		puts orderInfo;
 end;	
##puts order_ids.to_s

puts "HISTORY"
#hist=Btce::TradeAPI.new_from_keyfile.trade_history
# puts hist