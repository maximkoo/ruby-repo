require 'btce'
class StockData
	def getData(pair, inter)
		mmm="get_#{pair}_trades_json";
		hist=Btce::PublicAPI.send(mmm, {limit:6000});
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

class Order
	def run(stock)
		type='buy';
		percent_buy=0.995
		percent_sell=1.005
		# percent_buy=0.99
		# percent_sell=1.01
		price=stock.first["price"]*percent_buy
		#price=1090
		puts "Initial price=#{price}"

		dollars=100;
		crypto=0;

		stock.each do |x|
			# if type=="buy" 
			# 	then price=price*percent_buy
			# else
			# 	price=price*percent_buy;		
			# end;

			if type=="buy"	
				if x["price"]<=price && x["type"]=="bid"
					puts "Bought at #{Time.at(x['timestamp'])}, price=#{x['price']}, timestamp=#{x["timestamp"]}"
					price=x["price"]
					crypto=dollars.fdiv(x["price"])*0.998
					dollars=0;
					type='sell'
					price=price*percent_sell;
					puts "   new price to sell: #{price}"

				end;	
			else
				if x["price"]>=price && x["type"]=="ask"
					puts "Sold at #{Time.at(x['timestamp'])}, price=#{x['price']}, timestamp=#{x["timestamp"]}"
					price=x["price"]
					dollars=crypto*x["price"]*0.998
					crypto=0;
					type='buy'
					price=price*percent_buy
					puts "   new price to buy: #{price}, budget: #{dollars}"
				end;
			end;		
		end;
		puts "dollars=#{dollars}"
		puts "crypto=#{crypto}"	
	end	
end;	

g=StockData.new
#h=g.getData('nvc_usd',0);
#h=g.getData('nmc_usd',0);
#h=g.getData('ppc_usd',0);
#h=g.getData('btc_usd',0);
#h=g.getData('eth_usd',0);
h=g.getData('ltc_usd',0);
#puts h;
a1=h.map{|x| x["timestamp"]}.min
a2=h.map{|x| x["timestamp"]}.max

h1=h.sort{|a,b| a["timestamp"]<=>b["timestamp"]}
puts h1

p1=h.map{|x| x["price"]}.min
p2=h.map{|x| x["price"]}.max
puts (p2-p1).fdiv(p1).round(3)
puts "---"
puts Time.at(a1)
puts Time.at(a2)
puts "---"
Order.new.run(h1)