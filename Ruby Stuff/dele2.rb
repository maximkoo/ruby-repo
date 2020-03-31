require 'forwardable'

class Worker1
	def m1
		puts :m1
	end;

	def m2
		puts :m2
	end;	
end;

class Worker3
	def m3
		puts :m3
	end;
end;

class C1
	extend Forwardable
	delegate [:m1, :m2]=>:@a1, :m3=>:@a3
	# вызовы методов m1 и m2 перенаправляются в объект @a1, а вызов метода m3 перенаправляется в объект @a3
	def initialize
		@a1=Worker1.new
		@a3=Worker3.new
	end;	
end;	

C1.new.m1
C1.new.m2
C1.new.m3