class C1
	define_method :m0 do 
		puts :m0		
	end

	define_method(:m1) do |x,y,z=0|
		x+y+z
	end;	
end;

d=C1.new
puts d.m1(1,2)

puts d.respond_to?(:m0)
puts d.respond_to?(:m1)

d.send("m0")
puts d.send("m1",1,2,3)
m=d.method("m0")
m.call
m=d.method("m1")
m.call(1,2,3)