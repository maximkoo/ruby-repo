require './GameField.rb'
a=GameField.new
a.initialSeed("default");
a.output;
while true do
	#puts "Command 1"
	cmd=$stdin.gets
	exit if cmd.chomp=='exit' || cmd.chomp=='quit' || cmd.chomp=='bye' 
	a.move(cmd.chomp);
    a.output
    puts
    a.findChains
    a.outputChains
    a.dropLongChains
    a.output
	#puts "Command 2"
	#b=$stdin.gets
	a.additionalSeed(6)
	a.output
end