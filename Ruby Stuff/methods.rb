class C1
	def m1
		a=0;
		@b=0;
	end;

	def m2
		a=5;
		@b=5;
	end;	

	def m3
		#puts a;
		puts @b;
	end;	
end;

c=C1.new;
c.m1;
c.m2;
c.m3;