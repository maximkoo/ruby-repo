class DuckTester
	def test(a)
		begin
			a.quack
			a.fly
			a.float
			true
		rescue NoMethodError
			false
		end	
	end;	
end;	
puts
class Duck
	def quack
		puts "Quack-quack!"
	end

	def fly
		puts "I fly"
	end;
	
	def float
		puts "I float"
	end;
end;			

class GizmoDuck<Duck
	def quack
		print  "I am Gizmoduck and "
		super
	end	
end;

class UnknownBird
	def quack; puts "Quack"; end;
	def fly;   puts "I fly"; end;
	def float; puts "I float" end;
end;

class ProbablyADuck
	def Moo
		puts "Moo"
	end;
end;		

d=DuckTester.new

[Duck.new, GizmoDuck.new, UnknownBird.new, ProbablyADuck.new].each do |x|
	puts "*** #{x.class} ***"
		if d.test(x)
			puts " --> It is a duck!!!11" 
			puts 
		else 
			puts "Not a duck"
			puts
		end;	
end



