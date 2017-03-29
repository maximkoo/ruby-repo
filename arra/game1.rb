require './GameField.rb'
a=GameField.new
#a.randomSeedImi;
a.initialSeed(0);
a.output;
puts
#a.move('up')
#a.output
#if [1,2]==[1,3]
# puts "ololo";
#end; 
#puts a.getCell(0,0, nil)
#a.checkAdj(1,0)
puts 'Moving up'
a.move('up')
a.output;

a.findChains
#puts
#a.output_f
puts "Chains:"
a.outputChains
puts "All Checked:"
a.outputAllChecked
puts
a.dropLongChains
puts "Output:"
a.output;
#puts Random.new.rand(0..100)
puts "-------"
a.additionalSeed(3)
a.output