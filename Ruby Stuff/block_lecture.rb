def m0 
	puts "Method m0 executed"
end;	

def m1
	 puts 1
     yield #=> Block executed
     puts 2
end;

m1 do 
    puts "Block executed"
end;


def m2
	puts 1
	str="executed with parameter" 
    yield(str) #=> Block executed
    puts 2
end;

m2 do |x|
    puts "Block #{x}"
end;


def m3(a1,a2, str)
	puts a1
	yield str
	puts a2
end;	

m3(1,2,"executed with parameter") do |x|
    puts "Block #{x}"
end;

def m3(&b)
	puts 1
	str="executed with parameter"
    yield (str) #=> Block executed with parameter
    b.call (str) #=> Block executed with parameter
    puts 2
end;

m3 do |x|
    puts "Block #{x}"
end;

def m4(a1, a2, str, &b)
	puts a1
    yield str #=> Block executed
    b.call str #=> Block executed
    puts a2
end;

m4(1,2, 'executed with parameter') do |x|
   puts "Block #{x}"
end;

puts "arity=#{method("m4").arity}";

class C1
	attr_accessor :a1, :a2
	@a1=nil
	@a2=nil
	def initialize
		yield(self)
	end;	
end;

a=C1.new do |x|
	x.a1=5
	x.a2=10
end
puts a.inspect

b=C1.new do |x|
	x.a1=500
	x.a2=1000
end
puts b.inspect

p1=Proc.new do |x|
	puts "Proc 1 executed #{x}"
end

p2=Proc.new do |x,y|
	puts "Proc 2 executed #{x} #{y}"
end;
#p1.call("with parameter")
#p2.call("with two","parameters")

def m5(param1,param2)
	puts param1.class.name
	param1.call("with parameter")
	puts param2.class.name
	param2.call("with two","parameters")
end;	

m5(p1,p2)

def m6(&param1)
	puts param1.class.name
	param1.call
	yield
end;	

pp=Proc.new do 
	puts "Proc executed as a block"
end

m6(&pp)

m=method("m0")
puts m.inspect
m6(&m);

def m7(&param1)
	puts param1.class.name
	param1.call
	yield
end;

class C2
	def to_proc
		Proc.new{puts "This is C1 class!"}
	end;	
end;


c=C2.new

m7(&c)
m7(&m)

def m100(&b)
	puts "m100"
	yield
	#b.call
end;	

m100(&c)
