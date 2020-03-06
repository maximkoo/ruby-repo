require 'singleton'

class C1
include Singleton # делает метод new private-методом, так что нельзя потом сделать C1.new
	def m1(x)
		puts x
	end;	
end;

C1.instance.m1(:trololo) # вот так создается единственый экземпляр класса

puts "11111111"

class C2
	#eval "puts self"
	def m2
		eval "def m3 \n puts self\n end;"
	end;
end;

C2.new.m2		
C2.new.m3

puts C2.instance_methods.grep /^m[0-9]/