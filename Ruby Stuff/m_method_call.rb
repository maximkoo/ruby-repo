class C1
	def m1
		puts "This is m1"
	end;
end;	

c1=C1.new;
a="m1"

c1.send(a)


a="abc"
b=Marshal.dump(a) 
puts b #=> I"abc:ET
c=Marshal.load(b)
puts c #=> abc