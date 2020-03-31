class C1 
	def m1
	 puts "m1"
	end;

	def methods
		puts "Here are the methods of #{self.class.name}"
		super
	end;	
	#self.define_method(:ololo){puts "ololo!"} 
	define_method(:trololo1){puts "TROLOLO1"} 
end;
puts C1.methods.grep /ololo/; #=> пусто
puts C1.new.methods.grep /ololo/; #=> trololo

class C2
	eval("define_method(:trololo2){puts 'TROLOLO2'}")
end;

puts C2.methods.grep /ololo/; #=> пусто
puts C2.new.methods.grep /ololo/; #=> trololo2

class C3
	class_eval("define_method(:trololo3){puts 'TROLOLO3'}")
end;

puts C3.methods.grep /ololo/; #=> пусто
puts C3.new.methods.grep /ololo/; #=> trololo3

class C4
	instance_eval("define_method(:trololo4){puts 'TROLOLO4'}")
end;	

#puts C4.methods.grep /ololo/; #=> пусто
puts C4.new.methods.grep /ololo/; #=> trololo4

class C5
end;	
C5.class_eval("define_singleton_method(:trololo5){puts 'TROLOLO5'}")
puts C5.methods.grep /ololo/; #=> пусто
#puts C5.new.methods.grep /ololo/; #=> trololo5

class C6
end;
#C6.instance_eval("define_method(:trololo6){puts 'TROLOLO6'}")
C6.instance_eval("define_singleton_method(:trololo6){puts 'TROLOLO6'}")
# C6.instance_eval do	
# 	def trololo6
# 		puts "TROLOLO6"
# 	end;	
# end
puts C6.methods.grep /ololo/; #=> пусто
#puts C6.new.methods.grep /ololo/; #=> trololo6

a=C1.new;
a.trololo1;
a=C2.new;
a.trololo2;
a=C3.new;
a.trololo3;
a=C4.new;
a.trololo4;