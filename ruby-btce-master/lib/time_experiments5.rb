require 'btce'

STOCK_FEE=0.2
PERCENT_BUY=0.5
PERCENT_SELL=0.5
PAIR='nmc_usd';

class Dispatcher
	attr_accessor :order
	def initialize
		@tapi = Btce::TradeAPI.new_from_keyfile
		@ticker=Btce::Ticker.new(PAIR);
		puts @ticker.json;

		price0=@ticker.last;
		price=price0*(100-PERCENT_BUY).fdiv(100)/2
		puts price
		@order=Order.new(@tapi, "buy", price) # Initial
		@order.place;
	end;

	def m1
		puts Time.now
	end;	

	def run		
		sleep(10)
		puts @order.complete?
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
			t=BuyOrder.new(@tapi, @price).responce
		else
			t=SellOrder.new(@tapi, @price).responce
		end;	
		puts "Responce"
		puts t;
		if t["success"]==1	
			puts "Order **#{@type.upcase}** placed, order_id: #{t["return"]["order_id"]}, price: #{price}, time: #{Time.now}"
			@id=t["return"]["order_id"]
		else
			puts "No success, error: \"#{t["error"]}\""
		end;
		return @id	
	end;	


	def complete?
		@orders=@tapi.order_list
		puts
		puts "Active orders:"
		puts @orders
		puts

		if @orders["return"].key?(@id.to_s)
			puts "Order #{@id} still incomplete"
			return false;
		else
			th=@tapi.trade_history
			if th["return"].each do |k,v|
				if v.key?(@order_id)
					puts "Order #{@id} complete and found in trade history!"
					return true;
				end;	
				end;
			else
				puts "Order #{@id} is probably complete"
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
		j={"pair"=>PAIR,"type"=>"buy","amount"=>"0.1","rate"=>price.round(3).to_s};
		puts j;
		@responce=tapi.trade(j) #place order		
	end;
end;

class SellOrder<Order
	attr_accessor :responce
	def initialize(tapi, price)
		j={"pair"=>PAIR, "type"=>"sell", "amount"=>"0.1", "rate"=>price.to_s};
		@responce=tapi.trade(j) #place order
	end	
end;	

d=Dispatcher.new
#d.run