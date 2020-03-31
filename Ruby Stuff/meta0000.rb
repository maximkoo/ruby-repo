class Developer # то же самое, что создать метакласс без имени, как Class.new (при этом расширяющий метакласс Object, т.е. Class.new(ObjectMeta)) 
				# и от него создать единственный экземляр под названием Developer (при том унаследованный от класса Object, Developer<Object, Meta.new(Object))
	class<<self #Добавляем метод в метакласс, то есть для нашего класса он будет унаследован, как для экземпляра
		def m1
			puts "m1"
		end;
	end;

	def self.m2
		puts "m2"
	end;	

	def Developer.m3
		puts "m3"
		puts self.class #Class
		puts self.superclass #Object
	end;	

	def m4
		puts "m4"
	end;	

end;

Developer.m1;
Developer.m2;
Developer.m3;

puts "++++++++"
class<<Developer
	puts self.method_defined?("m1")#=>true
	puts self.method_defined?("m2")#=>true
	puts self.method_defined?("m3")#=>true
	puts self.method_defined?("m4")#=>false
end;	
puts "++++++++"

d1=Developer.new
puts d1.class;
class<<d1
	puts self;#<Class:#<Developer:0x2dda5e0>>
end;	
#d1.m1; #не работает!
d1.m4;

puts "d2d2d2d2"
d2=Developer.new
puts d2.class;#Developer
class<<d2 
	puts self;#=><Class:#<Developer:0x2ff6250>>
	puts self.class;#=>Class
	puts self.name;#=> пусто
	puts self.superclass;#=>Developer
	puts self.instance_of?(Class) #true
end;	
puts "d2d2d2d2"

puts "---"
class<<d1
	puts self.method_defined?("m1")#=>false
	puts self.method_defined?("m2")#=>false
	puts self.method_defined?("m3")#=>false
	puts self.method_defined?("m4")#=>true
end;	
puts "---"
puts d1.instance_of?(Class)


class X<Object
	def xm1
		puts "xm1"
	end;		
end;

class XX<X

end;	

X.new.xm1
XX.new.xm1

F=Class.new(X) do
#class F<X #--то же самое, что и 
	def fm1
		puts "fm1"
	end;
end;

fe=F.new
fe.fm1;		
fe.xm1;

puts fe.instance_of?(F)
puts fe.instance_of?(Class)

