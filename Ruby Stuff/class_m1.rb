class CC 
	def getMeta
		class<<self
			self;
		end;	
	end;	
end;

a=CC.new
a.getMeta.class_eval do 
def ololo
     puts "m1"
end;	
end

a.getMeta.instance_eval do 
def ololox
     puts "m1"
end;	
end

a.getMeta.ololox

a.class.class_eval do 
def trololo
     puts "m2"
end;	
end

puts a.getMeta.instance_methods.grep /ololo/
puts "--------"
puts a.getMeta.methods.grep /ololo/
puts "--------"
puts CC.instance_methods.grep /ololo/

class XX
end;

XX.class_eval do
def m1
	puts "m1xx"
end;
end;

XX.new.m1	
x=XX.new
x.class.class_eval do 
	def kokoko
		puts "kokoko"
	end;	
end
x.kokoko

class CC
end;
a.class.instance_eval do 
	def m11
    	puts "m11"
	end;
end;
CC.m11;

