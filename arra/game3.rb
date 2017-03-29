require './GameField.rb'
a=GameField.new
a.initialSeed("default");
a.output;
t=1
i=Random.new.rand(100)
while a.getZeroCount >0 do
	case i % 4 
	when 0 
	 a.move('right')
	when 1 
	 a.move('left')
	when 2
	 a.move('up')
	when 3
	 a.move('down')
	else puts "TROLOLO"
	end;
	i=Random.new.rand(100)
	t+=1
	a.findChains
	a.dropLongChains
	a.additionalSeed(6)
	#puts a.getTotalScore
	puts "Total turns: #{t}"
end
