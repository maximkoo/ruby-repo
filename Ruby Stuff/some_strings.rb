a=["aa1","2i2","3ui12","o44"];
a.each{|x| puts $1 if x=~ /(.*)/}

class C1
	def m1
		puts __method__
	end;	
	puts __method__
end;

d1=C1.new
class<<d1
	puts self;
end;	

class<<C1
	puts self;
end;	

d1.m1

puts __method__

def koko
	puts ?k
end;	

koko

def trololo(x)
     puts x
end;

trololo                     5

puts self #=> main
puts self.class

class X0
	class X1
		def x1
			puts "x1"
		end;
	end;
end;

c=X0::X1.new	

def yyy
	return 500
	600
end;

puts yyy	

class C1
	def m1(x)
		puts "m1(x)"
	end;	

	def m1(x,y)
		puts "m1(x,y)"
	end;
end;

c=C1.new
c.m1(5,6)		

class C2
	attr_accessor :b
	@a=1	
end;

puts C2.instance_variables	
d=C2.new
d.b=100
puts "=="
puts d.instance_variables

puts "**********"

class C3	
	eval "def self.m3\n puts :m3\n end"
end;	

puts C3.methods.grep /^m[0-9]/

class C4
	class_eval "def m4\n puts :m3\n end"
	class_eval "@a=5"
end;	

puts C4.new.methods.grep /^m[0-9]/
puts C4.instance_variables

class C5
	instance_eval "def m5\n puts :m3\n end"
	instance_eval "@b=10"
end;	

puts C5.methods.grep /^m[0-9]/
puts C5.instance_variables

puts "****************"
#C4.eval("puts :m4") # private
C4.class_eval("def m41\n puts :m41\n end\n")
C4.instance_eval("def m42\n puts :m41\n end\n")

puts C4.new.methods.grep /^m[0-9]/
puts C4.methods.grep /^m[0-9]/

class C6
end;

class<<C6
	define_method(:m6) do
		puts :m6
	end;
end;	

class C6
	define_method(:m61) do
		puts :m61
	end;
end;	
puts "--"
C6.m6
C6.new.m61

a=1
a="abc"
a=:x
a=Time.now

class CC1
	def initialize
		puts "An object created"
	end;
end;	

CC1.new	