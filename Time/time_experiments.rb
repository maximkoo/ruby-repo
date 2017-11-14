require 'btce'
require 'tk'
pair="btc_usd"
mmm="get_#{pair}_trades_json";
hist=Btce::PublicAPI.send(mmm, {limit:10});
#puts hist;
hist1=hist[pair]
#puts hist1

puts "---"
d=100;
hist2=hist1.group_by{|x| x["timestamp"]/d}
hist2=Hash[hist2.sort]
puts hist2
puts "---"
candles=[]
hist2.each do |k,v| 
	high=v.map{|x|x["price"]}.max
	low=v.map{|x|x["price"]}.min
	startts=v.map{|x|x["timestamp"]}.min
	endts=v.map{|x|x["timestamp"]}.max
	startPrice=v.select{|x|x["timestamp"]=startts}.first['price']
	endPrice=v.select{|x|x["timestamp"]=endts}.last['price']
	puts "timestamp=#{k} time=#{Time.at(k*d)} max=#{high} min=#{low} start=#{startPrice} end=#{endPrice}"
end;	


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
Tk.mainloop

