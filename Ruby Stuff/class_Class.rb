class Class
	def ttt
	  puts "ttt"
	end;
end;

class C1
	def C1.method_missing(*args) #args в данном случае - имя метода и параметры по порядку
		puts "You suck with your class method #{args.join(" ")}" 
	end;		

	def method_missing(*args)
		puts "You really suck with your instance method: #{args.join(" ")}" #=> Yous really suck with your instance method: virtual 10 20 30
	end;	
end;

puts C1.ttt	 
puts C1.virtual(1,2,3)#=> You suck with your class method virtual 1 2 3
puts C1.new.virtual(10,20,30)#=> Yous really suck with your instance method: virtual 10 20 30
