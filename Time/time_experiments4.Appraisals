require 'btce'
class StockData
	def getData(pair, inter)
		mmm="get_#{pair}_trades_json";
		hist=Btce::PublicAPI.send(mmm, {limit:3000});
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

g=StockData.new
h=g.getData('nmc_usd',0);
#puts h;
a1=h.map{|x| x["timestamp"]}.min
a2=h.map{|x| x["timestamp"]}.max

h1=h.sort{|a,b| a["timestamp"]<=>b["timestamp"]}
#puts h1