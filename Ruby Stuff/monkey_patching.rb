# Monkey patching in Ruby
class C1
	@a1=0
	@a2=0
	@a3=0
	@a4=0
	@koko=0
	@trololo=0

	ci=instance_variables;

	ci.each do |x|
		define_method(x.to_s.gsub('@','')) do 
			#puts self.class #внутри define_method мы уже как бы находимся внутри инстанса
			#puts self # self - это уже инстанс
			return C1.instance_variable_get(x) #потому к классу обращаемся по имени
		end

		define_method("#{x.to_s.gsub('@','')}=") do |z| 
			self.class.instance_variable_set(x,z) # или к классу можно обратиться, как self.class
		end;	
	end;
end;

c=C1.new

puts c.koko #=>0
c.koko=25
puts c.koko #=>25

#Выводим все переменные и их значения через динамически созданные методы
C1.instance_variables.each do |v|
	puts "#{v}=#{C1.instance_variable_get(v)}"
end;	


