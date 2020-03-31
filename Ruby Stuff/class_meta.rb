puts "	1 ************"
class C1 
	def m1
	 puts "m1"
	end;

	def C1.methods
		puts "* Here are the methods of #{self.name} class"
		super
	end;	

	def methods
		puts "* Here are the methods of #{self.class.name} instance"
		super
	end;	
end;
# Определим метод через define_method вне тела класса и без указания имени класса
define_method(:ololo){puts "ololo!"} #метод определяется, как глобальный, доступен для всех классов и экземпляров
# Видно, что он есть в классе Class
puts "** In Class class"
puts Class.methods.grep /ololo/;	#=> ololo
puts "** In Class instance"
puts Class.new.methods.grep /ololo/;#=> ololo
puts "** Run as Class class method"
Class.ololo;	#=> ololo!
puts "** Run as Class instance method"
Class.new.ololo;	#=> ololo!
# Есть в классе Object
puts "** In Object class"
puts Object.methods.grep /ololo/;#=> ololo
puts "** In Object instance"
puts Object.new.methods.grep /ololo/;#=> ololo
x=Object.new;#=> ololo!
puts "** Run as Object class method"
Object.ololo;#=> ololo!
puts "** Run as Object instance method"
x.ololo;#=> ololo!
#И в нашем новом классе тоже есть, и во всех последующих тоже будет
puts "** Run as C1 class method"
C1.ololo;#=> ololo!
xx=C1.new;
puts "** Run as C1 instance method"
xx.ololo;#=> ololo!

puts; puts "	2. ************"
# Добавим в наш класс С1 метод trololo 
#xx.trololo; #=> undefined method `trololo' # пока что его нет
class C1
	define_method(:trololo) do # метод добавляется, как метод экзмепляра
		puts "TROLOLO!" 
	end;	
end;	
puts "** In C1 class"
puts C1.methods.grep /ololo/;	 #=>ololo # нового метода trololo нет
puts "** In C1 instance"
puts xx.methods.grep /ololo/; #=>trololo ololo # а в методах экземпляра он есть
puts "** Run as C1 class method" 
#C1.trololo; #=> undefined method `trololo' for C1:Class #ошибка
puts "** Run as C1 instance method" 
xx.trololo; #=> TROLOLO! 

puts; puts "	3 ************"
# Теперь попробуем добавить в наш класс С1 метод trololo2, как __метод класса__
class C1
	define_singleton_method(:trololo2) do #метод добавляется, как метод класса
		puts "TROLOLO2!" 
	end;	
end;
puts "** In C1 class"
puts C1.methods.grep /ololo/;	 #=>ololo trololo2 # вот наш новый метод класса
puts "** In C1 instance"
puts xx.methods.grep /ololo/; #=>trololo ololo # а в методах экземпляра его нет
puts "** Run as C1 class method" 
C1.trololo2; #=> TROLOLO2!
puts "** Run as C1 instance method" 
#xx.trololo2; #=> undefined method `trololo2' for #<C1:0x2e6ab20> (NoMethodError)

puts; puts "	4. ************"
#создадим методы trololo3 и trololo4, как метод экземпляра и метод класса соответственно - и вне описания самого класса
#C1.define_method :trololo3 do #=>private method `define_method' called for C1:Class (NoMethodError)
#	puts "TROLOLO3" #=>то есть вызывать define_method для класса можно только внутри класса (т.е. внутри описание/контекста класса)!
#end;	
C1.define_singleton_method :trololo4 do # а вот это работает ОК
	puts "TROLOLO4"
end;	
puts "** Run as C1 class method" 
C1.trololo4; #=> TROLOLO4! # и запускается ок, как метод класса

########### ПОДВОДЯ ИТОГ
class CC
	def m1 
		puts "m1"
	end;
end;

class CC
	define_method :m1 do
		puts "m1"
	end;
end;

# class CC
# end;
# CC.define_method :m1 do ## НЕЛЬЗЯ !!!
# 		puts "m1"
# 	end;

class CC
	def CC.m1
		puts "m1"
	end;
end;

class CC
	define_singleton_method :m1 do
		puts "m1"
	end;
end;

class CC
end;
CC.define_singleton_method :m1 do 
		puts "m1"
	end;