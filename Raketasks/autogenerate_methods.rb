class C1
	def initialize
		@a=0
		@b=0
		@c=0	

		instance_variables.each do |x|
			define_singleton_method("#{x.to_s.gsub('@','')}=") do |z| # "@a" превращается в "a="
				instance_variable_set(x,z);
			end;	
			define_singleton_method("#{x.to_s.gsub('@','')}") do # "@a" превращается в "a"
				instance_variable_get(x)
			end;	
		end
	end;
end;		

d=C1.new
puts d.methods

puts "-------------------------"
d.a=150
puts d.a

