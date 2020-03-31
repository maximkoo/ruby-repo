require 'forwardable'

class Worker1 # Класс, в котором находятся реально выполняемые методы
	def m1
		puts :m1
	end;

	def m2
		puts :m2
	end;	
end;		

class Worker3 # Класс, в котором находятся реально выполняемые методы
	def m3
		puts :m3
	end;
end;

class C1 # класс-диспетчер
	extend Forwardable
	def_delegators :@a1, :m1, :m2
	#def_delegators :@a1, *[:m1, :m2] # то же самое !
	def_delegators :@a3, :m3
	def initialize
		@a1=Worker1.new
		@a3=Worker3.new
	end;
end;	

C1.new.m1
C1.new.m2
C1.new.m3

