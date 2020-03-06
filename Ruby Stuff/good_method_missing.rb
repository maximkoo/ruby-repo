# class C1
# 	def method_missing(*args)
# 		#x=args.first.to_s
# 		class<<self
# 			define_method(args.first.to_s+"=") do
# 				variable_set(args.first, 0)
# 				puts "#{args.first} is set to 0"
# 			end;	
# 			define_method(args.first) do 
# 				puts variable_get(args.first) 
# 			end
# 		end;
# 		#puts args.first;
# 	end;
# end;

class C1
	@a=1;
	def trololo
		@a=5;
		puts self; ##<C1:0x3052cf8>
		puts @a; # 5
		class<<self			
			puts self; ##<Class:#<C1:0x3052cf8>> # МЕТАКЛАСС для сущности a, экземпляра класса C1
			puts self.class; #class
			puts self.name #пусто потому что метакласс безымянный
			puts "@a=#{@a}"; # пусто
		end;
		puts "-------"
		puts self.class #C1
		self.class.class_eval %{@a=50} 		
		self.class.class_eval %{puts @a} #50	
		puts self.class.name; #C1
		class<<self
			puts self;			
			puts "self.name: #{self.name}";
			puts @a; #пусто
		end;	
		puts @a # 5
	end;	
	class<<self;
		puts self; #<Class:C1>
	end;
	puts "@a=#{@a}";
end;	

a=C1.new;
a.trololo;
puts C1.class
puts C1.singleton_class