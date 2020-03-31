outer = 1

def m
  inner = 99
  outer = 2; # хоть мы и поменяли здесь эту переменную, но 
  yield inner # блок приходит сюда вместе со своим окружением (binding), в котором outer=1, так что outer+inner=1+99=100
  puts "outer var in method = #{outer}" #=> 2, потому что это переменная из метода, а не из блока
  puts "inner var = #{inner}" #=>99  
end

m {|inner| outer += inner}
puts "outer var = #{outer}" #=>100

puts "-------"

a=1;
b=binding
puts b
def m0
	a=2;
end;
puts a
def m1(p1)
	#a=2;
	#p1.a=2; #undefined method `a=' for #<Binding:0x2cab220> (NoMethodError)
	p1.eval("a=2") # вотак надо
end;
m1(b);
puts a;

puts "Исследуем имеющиеся переменные"
puts "Main thread "<< local_variables.join(",") #=> a,b
puts "Binding b: "<<b.eval("local_variables.join(\",\")") ## a,b то же самое логично
puts "Значение переменной a из binding b "+b.eval("a").to_s#=> to_s надо для корректного преоьразования числа 2 в строку. Если не использовать конкатенацию, то to_s можно не писать
puts "Значение переменной a из binding b "+b.local_variable_get(:a).to_s # то же самое

def m3
	ololo=99;
	return binding;
end;
puts "Binding из метода м3: "<<m3.eval("local_variables.join(\",\")") ## ololo
puts "Значение переменной ololo из Binding m3 "<<m3.local_variable_get("ololo").to_s #=> 99

