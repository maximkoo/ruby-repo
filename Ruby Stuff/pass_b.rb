class C1
	def m1(a)
		a=300;
		puts "a=#{a}"
	end;
end;

b=100;
c1=C1.new
c1.m1(b)
puts "b=#{b}"