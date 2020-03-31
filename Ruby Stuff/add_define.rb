class C1
	def trololo1 # метод определяется, как метод экземпляра
		puts "TROLOLO1"
	end;
	def C1.trololo2 # метод определяется, как метод класса
		puts "TROLOLO2"
	end;
	define_method(:trololo3) do # несмотря на то, что define_method указан в контексте класса, метод определяется, как метод экземпляра
		puts "TROLOLO3" # просто потому, что метод define_method так устроен - всегда описывает метод, как метод экземпляра
	end;
	class<<self # метод определяется, как метод класса C1, то есть экземпляра метакласса
		define_method(:trololo4) do
			puts "TROLOLO4"
		end;
	end;	
	# def m1 #=> undefined method `define_method' for #<C1:0x2f06100> (NoMethodError)
	# 	define_method(:trololo5) do
	# 		puts "TROLOLO5"
	# 	end;
	# end;

	def m1
		class<<self # метод определяется, как метод конкретно взятого экземпляра класса C1 - 
			define_method(:trololo5) do # но на самом деле, как метод метакласса для этого экземпляра
	 			puts "TROLOLO5"
		 	end;
		end;	
	end;	

	def m2
		#self.class.define_method(:trololo6) do #private method `define_method' called for C1:Class (NoMethodError)
		self.class.class_eval do # можно только вот так 
		#self.class.class_eval # то же самое, потому что define_method так устроен - всегда описывает метод, как метод экземпляра
			define_method(:trololo6) do # в данном случае - экземпляра класса C1
				puts "TROLOLO6"
			end;	
		end;	
	end;	
end;

puts C1.methods.grep /ololo/ #=> trololo2 trololo4
puts "---"
a=C1.new;
a.m1;
a.m2;
puts a.methods.grep /ololo/ #=> trololo5 trololo1 trololo3 trololo6