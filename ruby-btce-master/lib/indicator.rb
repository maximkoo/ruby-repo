require 'indicators'
require 'btce'
my_data = Indicators::Data.new([1, 2, 3, 4, 5,10])
puts my_data.calc(:type => :sma, :params => 2).output
puts
puts my_data.calc(:type => :ema, :params => 2).output

my_data = Indicators::Data.new([1, 2, 3, 4, 5,6,7,8,9,9,9,9,9,9])
print "RSI: "
puts my_data.calc(:type => :rsi, :params => 14).output

#hist=Btce::TradeAPI.new_from_keyfile.trade_history("since"=>1509707437-100, "pair"=>"nvc_usd")
#puts hist
#tr=Btce::Trades.new("nvc_usd");
tr=Btce::PublicAPI.get_nvc_usd_trades_json({:limit=>14})
puts tr;
arr=[]
tr["nvc_usd"].each do |t|
	puts t["price"]
	arr<<t["price"]
end;	

my_arr= Indicators::Data.new(arr);
puts "---"
#puts my_arr.calc(:type => :sma, :params => arr.size).output
#puts my_arr.calc(:type => :rsi, :params => arr.size).output

trr=tr["nvc_usd"].group_by do |x|
	x["timestamp"]/100
end	

puts trr
puts "-------------------------------------------"
my_data = Indicators::Data.new([1, 2, 3, 4, 5,6,7,8,9,9,9,9,9,9,8,7,6,5,4,3,2,1,0,1,2,3,4,5,6,7,8,9,10,10,10,10,10,10,10,10])
#puts my_data.calc(:type => :rsi, :params => 14).output
puts my_data.calc(:type => :macd, :params => [12, 26, 9]).output.to_s