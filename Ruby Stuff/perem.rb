class C1
	attr_accessor :a #=> доступ к переменной a экземпляра класса (наследуется) Замечу, что переменную мы не объявляли явно
	@@a=1 # наследуется вместе со значением
	@a=2 #=> class instance variable - НЕ ТА ЖЕ САМАЯ, что в attr_accessor
	# эта переменная объявлена в экземляре класса class
	# наследуется переменная, но не значение
	a=3

	@bbb=0
	def C1.bbb=(x)
		@bbb=x
	end;
end;

c=C1.new
puts c.a #=> nil потому что мы не задали значение через attr_accessor
c.a=100

C1.instance_eval("puts instance_variables") #=> @a
C1.instance_eval("puts @a") #=> 2

c.instance_eval("puts @a") #=>100 значение, заданное в экземпляре через attr_accessor

C1.class_eval("puts @@a") #=> 1

puts "-----"

class C2<C1

end;

c=C2.new
puts c.a #=> nil потому что мы не задали значение через attr_accessor
c.a=100

C2.instance_eval("puts instance_variables") #=> @a
C2.instance_eval("puts @a") #=> 2

c.instance_eval("puts @a") #=>100 значение, заданное в экземпляре через attr_accessor

C2.class_eval("puts @@a") #=> 1

puts "!!!!!!!!!!"
C1.bbb=256;
C1.instance_eval("puts @bbb") #=> 256

class C2
	def m1
		m=101
		puts m
	end;	

	def m2
		#puts m => undefined local variable or method `m'
	end;
end;

c2=C2.new
c2.m1
c2.m2

ss=Hash.new
ss={"a"=>1, "b"=>5}
ss={a:1, b:5}
puts ss[:a].class
ss.each do |k,v|
	puts "#{k.class} #{v.class}"
end;	