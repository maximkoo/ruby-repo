class C1
	@q=100
	q=300
	class<<self
		attr_accessor :q
	end;	

	attr_reader :q
	def initialize
		@q=200;
	end;

	q=q+1
	#def C1.getW
#		@w
#	end;		
end;	

c1=C1.new
puts c1.q
puts C1.q

class C2<C1
end;

c2=C2.new
puts C2.q
C2.q=2000
puts C2.q	