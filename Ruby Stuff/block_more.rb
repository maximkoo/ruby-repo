def m1(a,b,&c)
	puts a
	puts b
	c.call if block_given?
end;

c=Proc.new{puts 3}

m1(1,2, &c)
#c=Proc.new{puts 3}
#d=Proc.new{puts 4}
#m1(1,2,c,d) 

def m2 (x,&y)
	x.call
	#y.call
end;	

x=proc{puts 100}
y=proc{puts 200}

class Fixnum
	def to_proc
		proc{puts self.to_s}
	end;	
end;	

a=2
m2(x,&a)

class C2
	m=C2.new
	puts m

	def koko
		puts "koko"
	end;	

	m.koko
end;	