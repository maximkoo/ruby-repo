class C1
	@a=100
	attr_accessor :a
	def initialize(x)
		@a=x
	end;

	def get_binding
		binding
	end;	
end;

@a=1

c1=C1.new(2)
c1.get_binding.eval ("puts @a")
c2=C1.new(20)
c2.get_binding.eval ("puts @a")
puts c2.get_binding

x=c1.get_binding
eval("puts @a", c1.get_binding)
puts "--"
eval("puts @a")
TOPLEVEL_BINDING.eval("puts @a")
# a="a"
# b=a
# c=a
# puts b==c
# puts b.equal?(c)
# a='b'
# puts a,b,c
# puts b==c
# puts b.equal?(c)
puts "+++++++"
c1.instance_eval("puts @a")
C1.class_eval("puts @a")