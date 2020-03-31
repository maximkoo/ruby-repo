class C1
	attr_accessor :a
	def initialize
		puts "C1 instance created"
	end;
end;

c1=C1.new do |x|
	x.a=100;
end;	

puts c1.a