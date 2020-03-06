class C1
	# def initialize(x)
	# 	@a=x
	# end;

	# def a
	# 	@a
	# end;	
	def m1
		puts "m1"
	end;

	def call_m2
		m2
	end;	

	def call_m3(cc)
		cc.m3
	end;

	private
	def m2
		puts "m2"
	end;

	protected
	def m3
		puts "m3"
	end;	
end;

c=C1.new
c.m1
c.call_m2
c2=C1.new
c2.call_m3(c)

