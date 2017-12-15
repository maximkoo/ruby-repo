require 'indicators'
a=[]
50.times do |i|
	a<<i
end
50.times do |i|
	a<<50-i
end
puts a.to_s
puts "------"
my_data   = Indicators::Data.new(a);
puts my_data.calc(:type => :macd, :params => [12, 26, 9]).output.to_s

