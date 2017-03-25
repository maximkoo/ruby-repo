a=1;

puts a

a=2 unless a==0

puts a

if a==2 then a=3; end;

puts a

if a==3
	a=4
end

puts a

a=5 if a==4

puts a

0==1 or a=6

puts a 

# (a..a).each do |x|
# 	x=7
# end	

# puts a

# Array.new.push(a).each do |i|
# 	i=8
# end;

# puts a

unless a==1 
	a=7
	puts a
end;	

a=8 unless 1==0
	
puts a

2*2==4 and a=9
puts a

class C1
	@p=1

	attr_accessor :pp
	def initialize
		@priority=1
	end;
	def priority
		@priority
	end;

	def C1.p
		@p
	end;	
end;

puts C1.new.priority		
puts C1.p

x=C1.new
x.pp=20
puts x.pp

