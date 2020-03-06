class C1
def m0
	C1.m1
	C1.m2
end;	
private
	def C1.m1
		puts "m1"
	end;	
protected
	def C1.m2
		puts "m2"
	end;		
end;

a=C1.new
a.m0
