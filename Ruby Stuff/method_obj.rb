class C1
	def m1
		puts "m1"
	end;

	def C1.m2
		puts "m2"
	end;	
end;

c=C1.new

a=c.method(:m1)
begin
	b=method(:m2)
rescue NameError 
	puts "OLOLO"
end;		
b=C1.method(:m2)
a.call
b.call

txt="puts 100500"
q=Proc.new{"#{txt}"}

eval %{a=Proc.new{#{txt}}}
a.call
puts "------"

class<<c
	def self.m3
		puts :m3
	end;	
end;	

puts c.singleton_class.methods.grep /^m/

