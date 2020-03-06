a=Hash.new
a={aa:[25,26,27], bb:30}
puts a
puts a[:aa]
10.times do 
puts rand(20)
end;

def m1(&b)
	#puts b.inspect if block_given?
	puts yield
end;

p=proc{puts "kokoko"}
p=proc{2*2}
m1(&p)

a=[3,2,4]
puts a.sort!.to_s

part=Hash.new
ids=[1,2,3]
part[ids]=[]

part[ids][1]=101
part[ids][2]=102
puts part[ids]
puts "=========="
puts :a
puts :b
puts 5.+(1)
#puts :a+:b
class Symbol
	def +(i)
		self.to_s<<i.to_s
	end;	
	def -(i)
		i.to_s<<self.to_s
	end;
end;
puts :a+:b	
puts :a-:b

puts 5.class
class Fixnum
	def +(i)
		self-1
	end;	
end;

puts 2+1