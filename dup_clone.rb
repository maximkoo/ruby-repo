# Разница между #clone и #dup

class C1
	attr_accessor :a
	def initialize
		@a=1
	end;
end;

d1=C1.new

d1.a=2; #назначим значение переменной a в объекте d1

def d1.m1 # добавим новый метод объекту d1
	puts :m1
end;

class<<d1 # добавим новую переменную объекту d1
	attr_accessor :b
end;
d1.b=10	

###

d2=d1.clone # полностью копирует объект d1 со всеми доопределенными свойствами
puts d2.a #=>2
puts d2.b #=>10
d2.m1 #=>m1

d3=d1.dup # выполняет конструктор класса объекта d1, то есть просто делает d3=C1.new
puts d3.a #=>2
#puts d3.b #=> ошибка
#d3.m1 #=> ошибка






