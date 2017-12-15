require 'btce'

STOCK_FEE=0.2
PERCENT_BUY=0.5
PERCENT_SELL=0.5
PAIR='nmc_usd';


class Dispatcher
	attr_accessor :order
	def initialize
		price=1.22;
		tapi = Btce::TradeAPI.new_from_keyfile
		j={"pair"=>PAIR,
		   "type"=>"buy",
		   "amount"=>"0.5",
		   "rate"=>price.to_s};
		#@responce=tapi.trade(j)
		#puts @responce
		puts "1.---"
		@orders=tapi.order_list
		puts @orders
		@id=90199467
		puts @orders["return"].key?(@id.to_s) if @orders.key?("return")
		puts @orders.key?("return")
		puts "2.---"
		th=tapi.trade_history
		puts th.to_s
		puts "3---"
		@orders={"success"=>"0", "error"=>"no orders"};
		puts !@orders.nil? && @orders.key?("return") && @orders["return"].key?(@id.to_s)
		if !@orders.nil? && @orders.key?("return") && @orders["return"].key?(@id.to_s)
			puts "#{Time.now} Order #{@id} still incomplete"
			#return false;
		else
			puts "Switch branch!"
		end;	
		puts "4.----"
		info=tapi.get_info;
		puts info
		puts info["return"]["funds"]["nmc"]
		puts 0.09571626+0.30348374
		puts (0.09571626+0.30348374).round(3)
	end;	
end;


d=Dispatcher.new		