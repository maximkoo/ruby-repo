module Interface1
	def m1
		super
	end;

	def m2
		super
	end;
end;

class C1
prepend Interface1
private
	def m1
		puts :m1
	end;
	def m2
		puts :m2
	end;
	def m3
		puts :m3
	end;
end;

c1=C1.new
c1.m1
c1.m2
#c1.m3 #=>private method `m3' called for #<C1:0x2c9b3b0> (NoMethodError)
