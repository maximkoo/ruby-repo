module M0
	class C0
		def m0
			puts "m0"
		end
	end;
end;

c=M0::C0.new

class C1
	include M0
def m1
	puts :m1
	cc=C0.new
end;
end;

x=C1.new

puts self.class

def m1
	puts "m1"
end;	

mmm=method(:m1)
mmm.call

puts 5+1

