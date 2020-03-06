require 'forwardable'
class C1
	def initialize
		@v1=100500
	end;

	def m1
		puts "m1"
	end;

	def getV1
		@v1
	end;	

	def setV1(value)
		@v1=value
	end;
end;

class C2
	extend Forwardable
	def_delegators :@c1, :m1, :getV1
	def initialize
		@c1=C1.new
	end;
end			

x=C2.new
x.m1
puts x.getV1

#puts global_variables
#if "foobar" =~ /foo(.*)/ then 
#   puts "The matching word was #{$1}"
#end
