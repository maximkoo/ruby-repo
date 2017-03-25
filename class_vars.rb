class C1
	@@b=1;
	def m1
		puts @@b;
	end;	
end;	

class C2<C1
	@@b=2
end;

puts C2.class_variables #=> @@b
C2.class_eval("puts @@b") #=> 2

c1=C1.new;
c1.m1; #=>2 # То есть переменнная, созданная в классе С1, переопределена в классе-наследнике

class C3<C1
	def m3
		puts @@b
	end;	
end;	

C3.new.m3; #=>2
x=C3.new.method(:m3)
x.call #=>2



