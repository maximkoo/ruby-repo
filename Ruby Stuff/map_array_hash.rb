a=[{x:1, y:2},{x:10,y:20}]

b=a.map{|p| {x:p[:x]+100,y:p[:y]+1000}}
puts b

class C1
	#attr_accessor :x;
	def initialize
	#	self.x=0
	@x=0
	end;

	def m1
	#	self.x=100;
		puts @x;
	end;	
end;		

C1.new.m1;