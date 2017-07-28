class C1
	def m1
		puts :m1
	end;
	a=1
	def self.b1
		#self.class.instance_variable_set(:a,2)
		a=2
	end;
	puts a	

	def self.a
		a
	end;	
end;

C1.b1
puts C1.a



	