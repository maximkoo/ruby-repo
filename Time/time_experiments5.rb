require 'btce'
require 'timers'

STOCK_FEE=0.2
PERCENT_BUY=0.5
PERCENT_SELL=0.5
PAIR='nmc_usd';

class Dispatcher
	attr_accessor :order
	def initialize
		tapi = Btce::TradeAPI.new_from_keyfile
		@ticker=Btce::Ticker.new "nvc_usd";
		puts @ticker.json;

		timers = Timers::Group.new
		every_five_seconds = timers.every(5) { puts "Another 5 seconds" }
		loop {timers.wait}
	end;

	def run
		price0=@ticker.last;
		price=price0*(100-PERCENT_BUY).fdiv(100)
		#@order=BuyOrder.new(@tapi, price);
	end;	
end;	

class Order
	attr_accessor :id, :type, :age, :price

	def initialize(tapi,type, price)
		@tapi=tapi;
		@type=type;
		@price=price;
		@age=0;
	end;	

	def recreate
		puts "Recreated!"
		@age=0;
	end;	

	def place
		if @type=='buy'
			t=BuyOrder.order(@tapi, @price)
		else
			t=SellOrder.order(@tapi, @price)
		end;	
		if t["success"]==1	
			puts "Order **#{@type.upcase}** placed, order_id: #{t["return"]["order_id"]}, price: #{price}, time: #{Time.now}"
			@id=t["return"]["order_id"]
		else
			puts "No success, error: \"#{t["error"]}\""
		end;	
	end;	


	def complete?(order_id)
		@orders=tapi.order_list
		if @orders["return"].key?(@order_id.to_s)
			puts "Order #{@order_id} still incomplete"
			return false;
		else
			th=tapi.trade_history
			if th["return"].each do |k,v|
				if v.key?(@order_id)
					puts "Order #{@order_id} complete and found in trade history!"
					return true;
				end;	
				end;
			else
				puts "Order #{@order_id} is probably complete"
				return true;
			end;
		end;
	end;

	def cancel
		t=tapi.cancel_order("order_id"=>@id.to_s);
		puts t 
	end;	
end;

class BuyOrder<Order
	attr_accessor :responce
	def initialize(tapi, price)
		j={"pair"=>PAIR,
		   "type"=>"buy",
		   "amount"=>"1",
		   "rate"=>price.to_s};
		#@responce=tapi.trade(j) #place order		
	end;
end;

class SellOrder<Order
	attr_accessor :responce
	def initialize(tapi, price)
		j={"pair"=>PAIR,
		   "type"=>"buy",
		   "amount"=>"1",
		   "rate"=>price.to_s};
		#@responce=tapi.trade(j) #place order
	end	
end;	

d=Dispatcher.new