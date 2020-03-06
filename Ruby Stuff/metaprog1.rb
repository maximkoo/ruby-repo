class Class
	def youSuck
		puts "you suck"
	end;
end;		

class C1
	def m1
		puts "m1"
	end;
end;

c=C1.new

def c.x=(a)
	@x=a;
end;	

def c.x
	@x
end;

c.x=5;
puts c.x;

class<<c
	def y=(a)
		@y=a;
	end;	

	def y
		@y
	end;
end;	

c.y=10
puts c.y

puts "wwwwwwwww"
class S1
	a=1;
	@a=10;
	@@aa=20;
	def self.mm
		puts "#{@a} #{@@aa}"
	end;
	puts a;

	def a
		@a
	end;	
end;

class S2<S1
end;

s1=S1.new
puts "qqq#{s1.a}"


S1.mm
S2.mm
puts %[78% of statistics are "made up" on the spot]
puts %i[s ss sss].join(', ')
puts %I[s ss sss+#{1+2}].join(', ')
puts %w[try give it a try].join(' ')

C1.youSuck
S1.youSuck