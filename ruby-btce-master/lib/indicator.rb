require 'indicators'
require 'btce'
my_data = Indicators::Data.new([1, 2, 3, 4, 5,10])
puts my_data.calc(:type => :sma, :params => 2).output


my_data = Indicators::Data.new([1, 2, 3, 4, 5,1])
puts my_data.calc(:type => :rsi, :params => 5).output

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
