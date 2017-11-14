require 'btce'
require 'tk'
class StockData
	def getData(pair, inter)
		mmm="get_#{pair}_trades_json";
		hist=Btce::PublicAPI.send(mmm, {limit:100});
		hist1=hist[pair]
		hist2=hist1.group_by{|x| x["timestamp"]/inter}
		hist2=Hash[hist2.sort.reverse]
		hist2
	end;	

	def getCandles(hist2)
		candles=[]
		hist2.each do |k,v| 
			high=v.map{|x|x["price"]}.max
			low=v.map{|x|x["price"]}.min
			startts=v.map{|x|x["timestamp"]}.min
			endts=v.map{|x|x["timestamp"]}.max
			startPrice=v.select{|x|x["timestamp"]=startts}.first['price']
			endPrice=v.select{|x|x["timestamp"]=endts}.last['price']
			#puts "timestamp=#{k} time=#{Time.at(k*d)} max=#{high} min=#{low} start=#{startPrice} end=#{endPrice}"
			c=Candle.new(high, low, startPrice, endPrice, k)
			candles<<c			
		end;
		candles	
	end;
end;	

class Candle
	attr_accessor :high, :low, :left, :right, :timestamp
	def initialize(high, low, left, right, timestamp)
		@high, @low, @left, @right, @timestamp=high, low, left, right, timestamp
	end;	
end;

class Service
	def self.getMaxCandle(c)
		c.map{|x|x.high}.max
		#c(&:high).max
	end;

	def self.getMinCandle(c)
		c.map{|x|x.low}.min
	end;	

	def self.getMidline(c)

	end;	
end;	

class Timeline
	attr_accessor :candles;
	def initialize(cnv)
		@cnv=cnv;
	end;
		
	def update
		spread=Service.getMaxCandle(candles)-Service.getMinCandle(candles);
		@midline=Service.getMinCandle(candles)+spread/2
		puts "spread=#{spread}"
		@scale=380/spread;
		puts "@scale=#{@scale}"
		draw;
	end;

	def draw
		x0=400;
		y00=400
		y0=y00/2;
		i=0
		candles.each do |c|
			puts x0-i*25, y00-y0-(c.high-@midline)*@scale, x0-20-i*25, y00-y0-(c.low-@midline)*@scale
			TkcRectangle.new(@cnv, x0-i*25, y00-y0-(c.high-@midline)*@scale, x0-20-i*25, y00-y0-(c.low-@midline)*@scale)
			#TkcRectangle.new(@cnv,100,100,200,200)
			i+=1;
		end;	
	end; 	
end;	

g=StockData.new
h=g.getData('btc_usd',100);
c=g.getCandles(h);
c.each do |candle|
	puts candle.inspect;
end;	
#puts h

@root1 = TkRoot.new {title "The ultimate cells game"; padx 10; pady 10;}
@cnv1=TkCanvas.new(@root1).grid :sticky => 'nwes', :column => 0, :row => 0
@cnv1['width']=400;
@cnv1['height']=400;
		
@frame1=TkFrame.new(@root).grid :sticky => 'nwes', :column => 1, :row => 0
TkGrid.columnconfigure( @frame1, 0, :weight => 10 )
TkGrid.rowconfigure( @frame1, 0, :weight => 100 )
TkGrid.rowconfigure( @frame1, 1, :weight => 100 )

# x=proc{gf.runLife}
# tm = TkTimer.new(250, -1,x)
# tm.start(0)
t=Timeline.new(@cnv1)
t.candles=c
t.update;
Tk.mainloop