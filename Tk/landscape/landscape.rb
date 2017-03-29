require 'tk'

class Landscape
 def initialize
 	@land=[]
 	@land[0]=[0,0]
 end;
 
 def generateNextPoint
 	y=Random.new.rand(100).round
 	puts "Generated #{y}"
 	y
 end;

 def fillArray
 	#puts "@land.last #{@land.last}"
 	lastIndexUsed=@land.size-1
 	x=@land.last.first
 	y=@land.last.last
 	puts "x:#{x} y:#{y}"
 	ynext=generateNextPoint
 	yprev=y
 	for i in 1..100 do
 		@land[lastIndexUsed+i]=[lastIndexUsed+i,(i*((ynext-y).to_f/100)+y).round(2)]
 		yprev=(i*((ynext-y).to_f/100)+y).round(2)
 		#puts yprev
 	end	
 end	

 def output
 	@land.each do |k|
 		print k
 		puts
 	end	
 end	

 def getLandscape
 	@land
 end	
end; #class

a=Landscape.new
a.fillArray
a.output
a.fillArray
a.output