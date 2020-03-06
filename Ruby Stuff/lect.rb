puts 1
class C1
	puts 2
	def initialize
		puts 3
	end;	

	def C1.m0
		puts 3.5
	end;	
	def m1
		puts 4
	end;	
end;	
puts 5

a=C1.new

a.methods.grep(/^m1/).each do |m|
	puts m
end;	

puts C1.superclass #=> Object

puts a.class
def a.m2
	#puts a.superclass => ошибка
	puts "m2"
	puts self.class
	puts self
	class<<self
		puts self.class
		puts self
		puts self.name
		puts self.superclass #=>C1
	end	
end;

a.m2

puts "-----------"

class C1
	puts self.class
	puts self
	class<<self
		puts self.class
		puts self
		puts self.name
		puts self.superclass #=>C1
	end	
end;	

puts "++++++++"

b1=C1.new
b2=C1.new
b3=b3
puts b1==b2
puts b1.equal?(b2)
puts b2==b2
puts b2.equal?(b2)

class C2
	#attr_reader "xxx"
	#attr_writer :xxx
	attr_accessor :xxx
	xxx=0
end;	

z=C2.new
puts z.xxx
z.xxx=25

a.methods.grep(/^m1/).each do |m|
	puts m
	a.send(m)
end;

m=["a","b"].method("join")
puts m.call(":")

m="a b c".method("split")
puts m.call(" ")

def mmy
	puts "---1---"
	yield
	puts "---2---"
end;	

a.methods.grep(/^m1/).each do |m|
	puts m
	x=a.method(m)
	x.call
	mmy(&x)
	mmy do
		x.call
		end;	
end;