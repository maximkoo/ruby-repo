class C1
	def self.inherited(s)
		puts "New subclass is #{s}"
	end;
end;

d1=C1.new;
def d1.getMeta
	class<<self
	#class<<d1
	#def getMeta
		self
	end;
end;

puts d1.getMeta.name
puts d1.getMeta.class

 # d1.getMeta.define_method("youSuck") do 
 # 		puts "You Suck"
 # 	end;



m=["a","b"].method("join")
puts m.call(":")

class C2<C1
	puts "C2 is made"
end;

(1..5).each do |i|
	eval %{class CC#{i}<C1; puts "CC#{i} is made"; end;}
end;	

puts "---------------"
(1..5).each do |i|
	C1.class_eval %{def m#{i} \nputs "This is m#{i}"; \nend;}
end;	
puts C1.instance_methods.grep(/^m[0-9]/)
#puts C1.method_defined?("m1")

dx=C2.new
dx.instance_eval %{def dxm \nputs "dxm"; \nend;}
dx.instance_eval(<<'EOF')
class<<dx
def dxm2
puts "dxm2"
end;	
end;	
EOF
dx.dxm
class<<dx
	puts "methods: "+ self.methods.grep(/dxm/).join(' ')
	puts "instance_methods: "+ self.instance_methods.grep(/dxm/).join(' ')
end;	

C2.class_eval %{attr_accessor :yyy;}
dx.yyy=5
puts "dx.yyy=#{dx.yyy}"

C2.instance_eval %{attr_accessor :xxx;}
dx.xxx=5
puts "dx.xxx=#{dx.xxx}"

class C3<C2

end;

puts C3.new.xxx;
puts C3.new.yyy	

class C10

end;

C10.instance_eval do
	#attr_accessor :xxx ## все ок
	 def xxx
	 	1000
	 end;	
end;	
cx=C10.new
#cx.xxx	 #undefined method `xxx' for #<C10:0x2cf8860> (NoMethodError)

puts Array<Enumerable #=> true
puts Array===Enumerable #=> false
