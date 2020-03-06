$a=100

class C1
	@@b=200;
	puts $a

	def setb(x)
		@@b=x
	end;	

	def getb
		@@b
	end;	
end;

class C2
	puts $a
	def m1
		puts $a
	end;	

end;	

C2.new.m1

a1=C1.new
a2=C1.new
puts a1.getb
a1.setb(300)
puts a2.getb

