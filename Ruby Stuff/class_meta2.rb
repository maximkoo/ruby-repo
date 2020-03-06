class C1 
	eval %{def trololo1	\nputs "TROLOLO1"; \nend;} # метод создается, как метод экземпляра
	# eval не работает с do, только со строкой
	class_eval %{def trololo2	\nputs "TROLOLO2"; \nend;} # метод создается, как метод экземпляра
	instance_eval %{def trololo3	\nputs "TROLOLO3"; \nend;} # метод создается, как метод класса
end;
puts C1.methods.grep /ololo1/; #=> пусто
puts C1.new.methods.grep /ololo1/; #=> trololo1

puts C1.methods.grep /ololo2/; #=> пусто
puts C1.new.methods.grep /ololo2/; #=> trololo2

puts C1.methods.grep /ololo3/; #=> trololo3
puts C1.new.methods.grep /ololo3/; #=> пусто

# C1.eval do #private method `eval' called for C1:Class (NoMethodError)
# 	def trololo4
# 		puts "TROLOLO4"
# 	end;	
# end;	

C1.class_eval do # Метод создаётся в "передаваемой части" класса С1, то есть передаётся во все экземпляры класса С1
	def trololo5
		puts "TROLOLO5"
	end;	
end;	

C1.instance_eval do # Метод создается в экземпляре класса Class, то есть в "статической" части класса C1
	def trololo6
		puts "TROLOLO6"
	end;	
end;

C1.new.trololo5; # Запускаем,как метод экземпляра
C1.trololo6; # Запускаем,как метод класса


a=C1.new
#a.class_eval("puts 'a.class_eval'") #undefined method `class_eval' for #<C1:0x2e63848> (NoMethodError)
a.instance_eval("puts 'a.instance_eval'")
#puts a.singleton_class.name;