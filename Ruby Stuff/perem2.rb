$a=0
class C1
	$a=1	
	def m1
		$a=2
	end;	

	def self.m2
		puts "olololo"
	end;	
end;

C1.new.m1

class C2
	puts $a
end;	

c=C1.new

puts c.singleton_class

class<<c
	puts self
end;	

puts c.singleton_class.instance_methods.grep /^m/
puts
puts c.singleton_class.methods.grep /^m/