require 'btce'

STOCK_FEE=0.2
PERCENT_BUY=0.5
PERCENT_SELL=0.5
PAIR='nmc_usd';
AMOUNT=0.2

class Dispatcher
	attr_accessor :order
	def initialize
		@tapi = Btce::TradeAPI.new_from_keyfile
		#@ticker=Btce::Ticker.new(PAIR);
		#@ticker=get_ticker;
		#puts @ticker.json;
		@state="buy"
		@price=get_price;
		@last_order_price=0;
	end;

	def get_ticker
		@ticker=Btce::Ticker.new(PAIR);
		@ticker;
	end;	

	def get_price
		@ticker=get_ticker;
		puts "Current ticker #{@ticker.json}"
		price0=@ticker.last;
		
		if @state=="buy"
			price=price0*(100-PERCENT_BUY).fdiv(100)#.fdiv(2)
			#price=price0*(100+PERCENT_BUY).fdiv(100)#.fdiv(2)
		else
			price=price0*(100+PERCENT_SELL).fdiv(100)#.fdiv(2)
		end;	
		price.round(3);
	end;	

	def run		
		puts "Initial price to buy #{@price}"
		#@order=BuyOrder.new(@tapi, price);
		
		@order=Order.new(@tapi, @state, @price);
		@order.place;
		@last_order_price=@price;
		@delay=60;
		@start=Time.now
		@last_update=Time.now
	 	while true
	 		#exit if gets.chomp == 'q'
	 			exit_requested = false
				Kernel.trap( "INT" ) { exit_requested = true }
				exit if exit_requested

		 	next if Time.now-@last_update<@delay		
		 	
		 	if @order.complete? 
		 		#puts "#{Time.now} Order #{@order.id} complete!"
		 		$last_order_price=@price;

		 		if @state=="buy"
		 			@state="sell"	
		 			p=@last_order_price.fdiv(PERCENT_BUY)*PERCENT_SELL.round(3)
		 			@price=[get_price,p].max	 					 			
		 		else
		 			@state="buy"		 			
		 			@price=get_price 
		 		end;	
		 		
		 		@order=Order.new(@tapi, @state, @price);
		 		@order.place;
		 		#exit
		 	#else
		 		#puts "#{Time.now} Order #{@order.id} still incomplete!"
		 	end;	
		 	ctime=Time.now
		 	@order.age+=ctime-@last_update;
		 	puts "Order age is #{@order.age.round(0)} seconds"
		 	@last_update=ctime;		 	
	 	end;	
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
		# if @type=='buy'
		# 	t=BuyOrder.new(@tapi, @price).responce
		# else
		# 	t=SellOrder.new(@tapi, @price).responce
		# end;	
		j={"pair"=>PAIR, "type"=>@type, "amount"=>AMOUNT, "rate"=>@price.to_s};
		puts j   
		t=@tapi.trade(j)
		if t["success"]==1	
			puts "Order **#{@type.upcase}** placed, order_id: #{t["return"]["order_id"]}, price: #{@price}, time: #{Time.now}"
			@id=t["return"]["order_id"]
			puts "Completed immediately" if @id==0
		else
			puts "No success, error: \"#{t["error"]}\""
		end;	
	end;	


	def complete?#(order_id)
		@orders=@tapi.order_list
		puts "Orders present..." if !@orders.nil?
		puts "#{@orders}"
		if !@orders.nil? && @orders.key?("return") && @orders["return"].key?(@id.to_s)
			puts "#{Time.now} Order #{@id} still incomplete"
			return false;
		else
			puts "Switch branch!"
			return true;
			th=@tapi.trade_history
			if th["return"].each do |k,v|
				if v.key?(@order_id)
					puts "#{Time.now} Order #{@id} complete and found in trade history!"
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
		t=@tapi.cancel_order("order_id"=>@id.to_s);
		puts t 
	end;	
end;

class BuyOrder#<Order
	attr_accessor :responce
	def initialize(tapi, price)
		#super(tapi, 'buy', price)
		j={"pair"=>PAIR,
		   "type"=>"buy",
		   "amount"=>AMOUNT,
		   "rate"=>price.to_s};
		puts j   
		@responce=tapi.trade(j) #place order		
	end;
end;

class SellOrder#<Order
	attr_accessor :responce
	def initialize(tapi, price)
		#super(tapi, 'sell', price)
		j={"pair"=>PAIR,
		   "type"=>"sell",
		   "amount"=>AMOUNT,
		   "rate"=>price.to_s};
		@responce=tapi.trade(j) #place order
	end	
end;	

d=Dispatcher.new
d.run;