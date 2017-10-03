class C1
	attr_accessor :a, :b
	def initialize
		@a=0
		@b=0
	end;

	def m1
		yield(self, @b)
		yield(self, @b)
	end;

	def m2(x)
		@a+=x
	end;	
end;

d=C1.new
d.m1 do |s, i|
	if s.a==0
		s.m2(100)
	else
		s.m2(200);
	end;
	i=99		
end;

puts d.a
puts d.b
