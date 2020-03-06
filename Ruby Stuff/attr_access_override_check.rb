class C1
	def initialize 
		@data=100;
	end;
end;

class C2<C1
	attr_accessor :data
end;

c1=C2.new
c1.data=200
puts c1.data