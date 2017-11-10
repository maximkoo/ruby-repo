require 'btce'
ticker = Btce::Ticker.new "nvc_usd"
puts ticker.json
puts

# info = Btce::TradeAPI.new_from_keyfile.get_info
# puts info
# puts
# puts info["return"]["rights"]

# orders = Btce::TradeAPI.new_from_keyfile.order_list
# puts orders
# puts
# puts orders["success"]
# #order_ids=[]
# #order_ids=["42296268", "41524896"]
# orders['return'].each do |k,v|
#  	puts k
#  	#puts "Order #{k} still incomplete!"  if order_ids.include? k
#  	puts v["pair"]
#  	puts v["amount"]
#  	puts v["status"]
#  end;	
# ##puts order_ids.to_s

hist=Btce::TradeAPI.new_from_keyfile.trade_history
puts hist