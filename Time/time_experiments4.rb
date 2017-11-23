require 'btce'
STOCK_FEE=0.2
PERCENT_BUY=0.5
PERCENT_SELL=0.5
class StockData
	def getData(pair, inter)
		mmm="get_#{pair}_trades_json";
		puts "Connecting to database... #{Time.now}"
		hist=Btce::PublicAPI.send(mmm, {limit:200});
		puts "Download complete #{Time.now}"
		hist1=hist[pair]
		#if inter>0
		#	hist2=hist1.group_by{|x| x["timestamp"]/inter}
		#else
			#hist2=hist1.group_by{|x| x["tid"]}
			hist2=hist1
		#end;	
		#hist2=Hash[hist2.sort.reverse]
		hist2
	end;
end;	

class Dispatcher
	attr_accessor :stock
	def initialize(stock)	
		@stock=stock	
		@start_time=stock.first["timestamp"]
		@end_time=stock.last["timestamp"]
		price0=stock.first["price"]
		#price1=price0*(100-PERCENT_BUY);
		@order=BuyOrder.new(price0)
	end;	

	def run
		puts "Main loop run #{Time.now}"
		(@start_time..@end_time).each do |t|
			#puts "t=#{t} time=#{Time.at(t)} order.age=#{@order.age}"

			if @order.age>180 && @order.is_a?(BuyOrder)
				@order.recreate;
			else 
				@order.age+=1;
			end;	

			#next if @stock.any?{|x| x["timestamp"]==t}
			deals=@stock.select{|x| x["timestamp"]==t}
			next if deals.size==0

			np=@order.check_price(deals)
			newOrder(np) if np>0				
		end;	
		puts "Main loop exit #{Time.now}"
	end;

	def newOrder(price)
		if @order.is_a? BuyOrder 
			@order=SellOrder.new(price)
		else
			@order=BuyOrder.new(price)	
		end;	
	end;	
end;	

class Order
	attr_accessor :age, :price

	def initialize(price)
		@age=0;
	end;	

	def recreate
		puts "Recreated!"
		@age=0;
	end;	

	def check_price(deals)

	end;	
end;

class BuyOrder<Order
	def initialize(price)
		super
		@price=price*(100-PERCENT_BUY)/100;
		puts "Created buy order, price=#{@price.round(3)}"
	end;	

	def recreate
		super
		#@price=price*1.001
		#puts "Recreated, new price: #{@price}"
	end;

	def check_price(deals)
		q=deals.select{|d| d["price"]<=@price}
		if q.size!=0
			#puts "q=#{q}"
			puts "Bought at #{q.first["price"]} on #{Time.now}"
			return q.first["price"];
		else
			return 0;
		end;	
	end;	
end;

class SellOrder<Order
	def initialize(price)
		super
		@price=price*(100+PERCENT_SELL)/100;
		puts "Created sell order, price=#{@price.round(3)}"
	end;

	def recreate
		super
		#@price=price*0.999
	end;

	def check_price(deals)
		q=deals.select{|d| d["price"]>=@price}
		if q.size!=0;
			#puts "q=#{q}"
			puts "Sold at #{q.first["price"]} on #{Time.now}"
			return q.first["price"];
		else
			return 0;
		end;
	end;	
end;	

g=StockData.new
h=g.getData('nvc_usd',0);
#puts h;
a1=h.map{|x| x["timestamp"]}.min
a2=h.map{|x| x["timestamp"]}.max
puts "Sorting data"
h1=h.sort{|a,b| a["timestamp"]<=>b["timestamp"]}
puts "Sorting complete"
puts h1

p1=h.map{|x| x["price"]}.min
p2=h.map{|x| x["price"]}.max

puts "---"
puts Time.at(a1)
puts Time.at(a2)
puts "---"
puts (p2-p1).fdiv(p1).round(3)

d=Dispatcher.new(h1)
d.run