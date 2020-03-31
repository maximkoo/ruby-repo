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
	def_delegator :@a1, :m1, :method_named_m1 # здесь method_named_m1 - псевдоним для метода m1
	def_delegator :@a1, :m2 # здесь нет псевдонима
	def_delegator :@a3, :m3, :method_named_m3 # здесь method_named_m3 - псевдоним для метода m3
	# вызовы методов m1 и m2 перенапрвляются в объект @a1, а вызов метода m3 перенаправляется в объект @a3
	def initialize
		@a1=Worker1.new
		@a3=Worker3.new
	end;	
end;	

# C1.new.m1=> No method Error
C1.new.method_named_m1
C1.new.m2
C1.new.method_named_m3
